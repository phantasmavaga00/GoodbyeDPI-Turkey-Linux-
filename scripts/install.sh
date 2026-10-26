#!/bin/bash
set -euo pipefail

INSTALL_DIR="/home/white/goodbyedpi-linux"
SERVICE_FILE="/etc/systemd/system/goodbyedpi.service"
RESOLVED_CONF="/etc/systemd/resolved.conf.d/goodbyedpi.conf"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

info()  { echo -e "${GREEN}[INFO]${NC} $*"; }
warn()  { echo -e "${YELLOW}[WARN]${NC} $*"; }
error() { echo -e "${RED}[ERROR]${NC} $*" >&2; }

if [[ $EUID -ne 0 ]]; then
    error "Bu script root olarak çalıştırılmalı!"
    error "Kullanım: sudo bash $0"
    exit 1
fi

info "GoodbyeDPI Linux kurulumu başlıyor..."

info "Bağımlılıklar kontrol ediliyor..."

if ! pacman -Q libnetfilter_queue &>/dev/null; then
    info "libnetfilter_queue kuruluyor..."
    pacman -S --noconfirm libnetfilter_queue
else
    info "libnetfilter_queue zaten kurulu."
fi

info "Kaynak kod derleniyor..."
cd "$INSTALL_DIR"
make clean
make

info "Binary kopyalanıyor..."
install -Dm755 "$INSTALL_DIR/goodbyedpi" "$INSTALL_DIR/bin/goodbyedpi"

info "systemd servis dosyası kuruluyor..."
cp "$INSTALL_DIR/systemd/goodbyedpi.service" "$SERVICE_FILE"
systemctl daemon-reload

info "DNS yapılandırması ayarlanıyor (Quad9 DNS 9.9.9.9)..."

mkdir -p /etc/systemd/resolved.conf.d/

cat > "$RESOLVED_CONF" << 'EOF'
[Resolve]
DNS=9.9.9.9#dns.quad9.net 149.112.149.112#dns.quad9.net
FallbackDNS=9.9.9.10#dns.quad9.net 149.112.149.10#dns.quad9.net
DNSOverTLS=opportunistic
DNSSEC=yes
EOF

info "systemd-resolved yeniden başlatılıyor..."
systemctl restart systemd-resolved

info "Servis etkinleştiriliyor ve başlatılıyor..."
systemctl enable goodbyedpi.service
systemctl start goodbyedpi.service

sleep 1
echo ""
info "=== Kurulum tamamlandı ==="
echo ""
systemctl status goodbyedpi.service --no-pager -l || true
echo ""
info "nftables kuralları:"
nft list table inet goodbyedpi 2>/dev/null || warn "nftables kuralları henüz yüklenmedi"
echo ""
info "DNS testi:"
resolvectl status 2>/dev/null | grep -A3 "DNS Servers" || dig +short discord.com @9.9.9.9
echo ""
info "Discord erişim testi (birkaç saniye sürebilir):"
curl -s --max-time 10 -o /dev/null -w "HTTP durum kodu: %{http_code}\n" https://discord.com || \
    warn "Discord testi başarısız - ISP'ye göre değişebilir"
echo ""
info "Logları görüntülemek için: journalctl -u goodbyedpi -f"
