#!/bin/bash
INSTALL_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
BINARY="$INSTALL_DIR/bin/goodbyedpi"
NFT_SCRIPT_SRC="$INSTALL_DIR/scripts/nft-load.sh"
NFT_SCRIPT_DST="/usr/local/sbin/goodbyedpi-nft-load.sh"
SERVICE_FILE="/etc/systemd/system/goodbyedpi.service"
RESOLVED_CONF="/etc/systemd/resolved.conf.d/goodbyedpi.conf"
RESOLV_CONF="/etc/resolv.conf"

RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'; CYAN='\033[0;36m'; NC='\033[0m'
info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[HATA]${NC} $*" >&2; }
title() { echo -e "${CYAN}=== $* ===${NC}"; }

check_root() {
    if [[ $EUID -ne 0 ]]; then
        error "Bu script root olarak çalıştırılmalı!"
        error "Kullanım: sudo bash $0"
        exit 1
    fi
}

build_binary() {
    if [[ ! -f "$BINARY" ]]; then
        info "Binary bulunamadı, derleniyor..."
        if ! pacman -Q libnetfilter_queue &>/dev/null; then
            info "libnetfilter_queue kuruluyor..."
            pacman -S --noconfirm libnetfilter_queue
        fi
        make -C "$INSTALL_DIR" clean
        make -C "$INSTALL_DIR"
        install -Dm755 "$INSTALL_DIR/goodbyedpi" "$BINARY"
    else
        info "Binary mevcut: $BINARY"
    fi
}

install_nft_script() {
    local dns_redir=${1:-1}
    cp "$NFT_SCRIPT_SRC" "$NFT_SCRIPT_DST"
    chmod 755 "$NFT_SCRIPT_DST"
    sed -i "s/DNS_REDIR=\${DNS_REDIR:-1}/DNS_REDIR=\${DNS_REDIR:-${dns_redir}}/" "$NFT_SCRIPT_DST" 2>/dev/null || true
}

create_service() {
    local extra_args="$1"
    local dns_redir="${2:-1}"
    cat > "$SERVICE_FILE" << EOF
[Unit]
Description=GoodbyeDPI Turkey - Linux DPI Bypass
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
Environment=DNS_REDIR=${dns_redir}
ExecStartPre=${NFT_SCRIPT_DST}
ExecStart=${BINARY} ${extra_args}
ExecStopPost=-/usr/sbin/nft delete table inet goodbyedpi
Restart=on-failure
RestartSec=5
User=root
CapabilityBoundingSet=CAP_NET_ADMIN CAP_NET_RAW
AmbientCapabilities=CAP_NET_ADMIN CAP_NET_RAW
StandardOutput=journal
StandardError=journal
SyslogIdentifier=goodbyedpi

[Install]
WantedBy=multi-user.target
EOF
    systemctl daemon-reload
}

configure_dns_yandex() {
    info "DNS Quad9'e yönlendiriliyor (9.9.9.9)..."
    mkdir -p /etc/systemd/resolved.conf.d/
    cat > "$RESOLVED_CONF" << 'EOF'
[Resolve]
DNS=9.9.9.9#dns.quad9.net 149.112.149.112#dns.quad9.net
FallbackDNS=9.9.9.10#dns.quad9.net 149.112.149.10#dns.quad9.net
DNSOverTLS=opportunistic
DNSSEC=yes
DNSStubListener=no
EOF
    chattr -i "$RESOLV_CONF" 2>/dev/null || true
    echo "nameserver 9.9.9.9" > "$RESOLV_CONF"
    echo "nameserver 149.112.149.112" >> "$RESOLV_CONF"
    chattr +i "$RESOLV_CONF"
    systemctl restart systemd-resolved
}

start_service() {
    info "Servis etkinleştiriliyor..."
    systemctl enable goodbyedpi.service
    systemctl restart goodbyedpi.service
    sleep 1
    if systemctl is-active --quiet goodbyedpi.service; then
        info "Servis başarıyla başlatıldı!"
    else
        error "Servis başlatılamadı. Log: journalctl -u goodbyedpi -n 20"
        journalctl -u goodbyedpi --no-pager -n 10
        exit 1
    fi
}

print_status() {
    echo ""
    title "Durum"
    systemctl status goodbyedpi.service --no-pager -l | head -15
    echo ""
    info "nftables kuralları:"
    nft list table inet goodbyedpi 2>/dev/null || warn "nftables tablosu bulunamadı"
    echo ""
    info "Discord erişim testi:"
    local ip
    ip=$(dig discord.com +short 2>/dev/null | head -1)
    if [[ -n "$ip" && "$ip" != "195.175.254.2" ]]; then
        info "DNS çözümleme: discord.com → $ip (gerçek IP) ✓"
    else
        warn "DNS çözümleme: discord.com → $ip (ISP yönlendirmesi olabilir)"
    fi
    echo ""
    info "Log izleme: journalctl -u goodbyedpi -f"
    info "Kaldırma:   sudo bash $INSTALL_DIR/service_remove.sh"
}
