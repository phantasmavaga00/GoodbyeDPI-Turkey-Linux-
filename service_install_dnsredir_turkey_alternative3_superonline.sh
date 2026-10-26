#!/bin/bash
source "$(dirname "$0")/scripts/common.sh"
check_root

title "GoodbyeDPI Turkey - Alternatif 3 SuperOnline (TTL=3, DNS=Quad9)"
info "Mod: Fake TTL=3, Fragment=Kapalı, DNS=Quad9"

build_binary
install_nft_script 1
create_service \
    "--no-fragment --set-ttl 3 --dns-addr 9.9.9.9 --dns-port 53 --dnsv6-addr 2620:fe::fe --dnsv6-port 53 --queue-num 0" \
    1
configure_dns_yandex
start_service
print_status
