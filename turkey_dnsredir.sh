#!/bin/bash
INSTALL_DIR="$(cd "$(dirname "$0")" && pwd)"
source "$INSTALL_DIR/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Tek Seferlik Çalıştırma"
warn "Bu terminal kapatılırsa goodbyedpi durur!"
warn "Sistem servisi için: sudo bash service_install_dnsredir_turkey.sh"
echo ""

build_binary
install_nft_script 1

DNS_REDIR=1 "$NFT_SCRIPT_DST"

configure_dns_yandex

info "goodbyedpi başlatılıyor (Ctrl+C ile durdur)..."
"$BINARY" --fragment-size 5 --set-ttl 5 \
    --dns-addr 9.9.9.9 --dns-port 53 \
    --dnsv6-addr 2620:fe::fe --dnsv6-port 53 \
    --queue-num 0

info "Temizleniyor..."
/usr/sbin/nft delete table inet goodbyedpi 2>/dev/null
info "GoodbyeDPI durdurdu."
