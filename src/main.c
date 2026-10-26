#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <signal.h>
#include <unistd.h>
#include <getopt.h>
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>

#include "main.h"
#include "nfqueue.h"
#include "conntrack.h"

config_t g_cfg;
int g_rawsock4 = -1;
int g_rawsock6 = -1;
volatile int g_running = 1;

static void signal_handler(int sig) {
    (void)sig;
    g_running = 0;
    fprintf(stderr, "\nStopping GoodbyeDPI Linux...\n");
}

static void print_usage(const char *prog) {
    fprintf(stderr,
        "GoodbyeDPI Linux %s\n"
        "Usage: %s [options]\n\n"
        "  --fragment-size N     TCP fragment size (default: 5)\n"
        "  --no-fragment         Disable TCP fragmentation (only fake packets)\n"
        "  --set-ttl N           TTL for fake packets (default: 5)\n"
        "  --dns-addr ADDR       IPv4 DNS server to redirect to\n"
        "  --dns-port PORT       Port for IPv4 DNS server (default: 53)\n"
        "  --dnsv6-addr ADDR     IPv6 DNS server to redirect to\n"
        "  --dnsv6-port PORT     Port for IPv6 DNS server (default: 53)\n"
        "  --queue-num N         NFQUEUE number (default: 0)\n"
        "  --no-fake             Disable fake packet injection\n"
        "  --help                Show this help\n\n"
        "Turkey preset (default): --fragment-size 5 --set-ttl 5\n"
        "                         --dns-addr 9.9.9.9 --dns-port 53\n"
        "                         --dnsv6-addr 2620:fe::fe --dnsv6-port 53\n",
        GOODBYEDPI_VERSION, prog);
}

static int init_raw_sockets(void) {
    int one = 1;

    g_rawsock4 = socket(AF_INET, SOCK_RAW, IPPROTO_RAW);
    if (g_rawsock4 < 0) {
        perror("socket(AF_INET, SOCK_RAW)");
        fprintf(stderr, "Make sure you run as root or have CAP_NET_RAW capability.\n");
        return -1;
    }

    if (setsockopt(g_rawsock4, IPPROTO_IP, IP_HDRINCL, &one, sizeof(one)) < 0) {
        perror("setsockopt(IP_HDRINCL)");
        return -1;
    }

    int mark = 0x1;
    if (setsockopt(g_rawsock4, SOL_SOCKET, SO_MARK, &mark, sizeof(mark)) < 0) {
        perror("setsockopt(SO_MARK)");
    }

    g_rawsock6 = socket(AF_INET6, SOCK_RAW, IPPROTO_RAW);
    if (g_rawsock6 < 0) {
        perror("socket(AF_INET6, SOCK_RAW) - IPv6 fake packets disabled");
        g_rawsock6 = -1;
    } else {
        int mark6 = 0x1;
        setsockopt(g_rawsock6, SOL_SOCKET, SO_MARK, &mark6, sizeof(mark6));
    }

    return 0;
}

int main(int argc, char *argv[]) {
    memset(&g_cfg, 0, sizeof(g_cfg));
    g_cfg.fragment_size = FRAGMENT_SIZE_DEFAULT;
    g_cfg.fragment_enabled = 1;
    g_cfg.set_ttl = FAKE_TTL_DEFAULT;
    strncpy(g_cfg.dns_addr, "9.9.9.9", sizeof(g_cfg.dns_addr) - 1);
    g_cfg.dns_port = 53;
    strncpy(g_cfg.dnsv6_addr, "2620:fe::fe", sizeof(g_cfg.dnsv6_addr) - 1);
    g_cfg.dnsv6_port = 53;
    g_cfg.queue_num = NFQUEUE_NUM_DEFAULT;
    g_cfg.fake_enabled = 1;

    static struct option long_opts[] = {
        {"fragment-size", required_argument, 0, 'f'},
        {"no-fragment",   no_argument,       0, 'F'},
        {"set-ttl",       required_argument, 0, 't'},
        {"dns-addr",      required_argument, 0, 'd'},
        {"dns-port",      required_argument, 0, 'p'},
        {"dnsv6-addr",    required_argument, 0, 'D'},
        {"dnsv6-port",    required_argument, 0, 'P'},
        {"queue-num",     required_argument, 0, 'q'},
        {"no-fake",       no_argument,       0, 'n'},
        {"help",          no_argument,       0, 'h'},
        {0, 0, 0, 0}
    };

    int opt;
    while ((opt = getopt_long(argc, argv, "f:Ft:d:p:D:P:q:nh", long_opts, NULL)) != -1) {
        switch (opt) {
            case 'f':
                g_cfg.fragment_size = atoi(optarg);
                if (g_cfg.fragment_size < 1 || g_cfg.fragment_size > 1400) {
                    fprintf(stderr, "Invalid fragment-size: %s\n", optarg);
                    return 1;
                }
                break;
            case 'F':
                g_cfg.fragment_enabled = 0;
                break;
            case 't':
                g_cfg.set_ttl = (uint8_t)atoi(optarg);
                break;
            case 'd':
                strncpy(g_cfg.dns_addr, optarg, sizeof(g_cfg.dns_addr) - 1);
                break;
            case 'p':
                g_cfg.dns_port = (uint16_t)atoi(optarg);
                break;
            case 'D':
                strncpy(g_cfg.dnsv6_addr, optarg, sizeof(g_cfg.dnsv6_addr) - 1);
                break;
            case 'P':
                g_cfg.dnsv6_port = (uint16_t)atoi(optarg);
                break;
            case 'q':
                g_cfg.queue_num = atoi(optarg);
                break;
            case 'n':
                g_cfg.fake_enabled = 0;
                break;
            case 'h':
                print_usage(argv[0]);
                return 0;
            default:
                print_usage(argv[0]);
                return 1;
        }
    }

    fprintf(stderr, "GoodbyeDPI Linux %s starting...\n", GOODBYEDPI_VERSION);
    fprintf(stderr, "  Fragment      : %s (%d bytes)\n",
            g_cfg.fragment_enabled ? "yes" : "no", g_cfg.fragment_size);
    fprintf(stderr, "  Fake TTL      : %d\n", g_cfg.set_ttl);
    fprintf(stderr, "  Fake packets  : %s\n", g_cfg.fake_enabled ? "yes" : "no");
    fprintf(stderr, "  DNS addr      : %s:%d\n", g_cfg.dns_addr, g_cfg.dns_port);
    fprintf(stderr, "  DNS IPv6      : %s:%d\n", g_cfg.dnsv6_addr, g_cfg.dnsv6_port);
    fprintf(stderr, "  NFQUEUE num   : %d\n", g_cfg.queue_num);

    signal(SIGINT, signal_handler);
    signal(SIGTERM, signal_handler);
    signal(SIGPIPE, SIG_IGN);

    if (init_raw_sockets() != 0)
        return 1;

    conntrack_init();

    fprintf(stderr, "Listening on NFQUEUE %d...\n", g_cfg.queue_num);
    nfqueue_loop(g_cfg.queue_num);

    conntrack_cleanup_all();
    if (g_rawsock4 >= 0) close(g_rawsock4);
    if (g_rawsock6 >= 0) close(g_rawsock6);

    fprintf(stderr, "GoodbyeDPI Linux stopped.\n");
    return 0;
}
