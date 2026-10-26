#!/bin/bash
LOG=/tmp/goodbyedpi-nft.log
DNS_REDIR=${DNS_REDIR:-1}
NFT=/usr/sbin/nft

echo "==== nft-load.sh $(date) [DNS_REDIR=${DNS_REDIR}] ====" >> "$LOG"

$NFT delete table inet goodbyedpi >> "$LOG" 2>&1

$NFT add table inet goodbyedpi >> "$LOG" 2>&1 || exit 1

$NFT "add chain inet goodbyedpi output_dpi { type filter hook output priority mangle; policy accept; }" >> "$LOG" 2>&1 || exit 1

$NFT add rule inet goodbyedpi output_dpi meta mark 0x00000001 accept >> "$LOG" 2>&1
$NFT add rule inet goodbyedpi output_dpi ip daddr { 127.0.0.0/8, 10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16, 169.254.0.0/16 } accept >> "$LOG" 2>&1
$NFT add rule inet goodbyedpi output_dpi ip6 daddr { ::1, fc00::/7, fe80::/10 } accept >> "$LOG" 2>&1
$NFT add rule inet goodbyedpi output_dpi tcp dport { 80, 443 } queue num 0 bypass >> "$LOG" 2>&1 || exit 1

if [ "${DNS_REDIR}" = "1" ]; then
    $NFT "add chain inet goodbyedpi nat_out { type nat hook output priority -100; policy accept; }" >> "$LOG" 2>&1 || exit 1
    $NFT add rule inet goodbyedpi nat_out ip daddr != 127.0.0.0/8 udp dport 53 dnat ip to 9.9.9.9:53 >> "$LOG" 2>&1 || exit 1
fi

echo "OK" >> "$LOG"
exit 0
