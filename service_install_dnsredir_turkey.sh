#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Linux Quad9 Kurulumu"
info "Mod: Fragment=5 byte, TTL=5, DNS=Quad9 (önerilen)"

build_binary
install_nft_script 1
create_service \
    "--fragment-size 5 --set-ttl 5 --dns-addr 9.9.9.9 --dns-port 53 --dnsv6-addr 2620:fe::fe --dnsv6-port 53 --queue-num 0" \
    1
configure_dns_yandex
start_service
print_status
