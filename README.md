# GoodbyeDPI Turkey - Linux (Quad9 Edition)

> **Discord, YouTube ve ISP Engellerine Karşı Güvenli ve Hızlı Erişim**  
> Bu proje, Türkiye'deki internet servis sağlayıcıları (ISP) tarafından uygulanan Deep Packet Inspection (DPI) engellemelerini aşmak amacıyla geliştirilmiş, **Quad9 DNS** altyapısıyla güçlendirilmiş güvenli bir çözümdür.

---

## 📜 Proje Tarihçesi ve Dayanak

Bu proje, orijinal **[ValdikSS/GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)** (Windows) projesinin, Türkiye'ye özgü filtreleme kurallarını içeren **[cagritaskn/GoodbyeDPI-Turkey](https://github.com/cagritaskn/GoodbyeDPI-Turkey)** forkundan türetilmiş, Linux platformuna uyarlanmış ve **Quad9 DNS** altyapısıyla güçlendirilmiş özel bir versiyondur.

### Neden Fork Edildi?
Orijinal projeler varsayılan olarak **Yandex DNS** (`77.88.8.8`) kullanmaktadır. Ancak:
- **Güvenlik Endişeleri:** Yandex'in veri toplama politikaları ve gizlilik kaygıları.
- **Performans:** Türkiye'de bazı durumlarda yavaş yanıt süreleri.
- **Modern Standartlar:** Şifreli DNS (DoT/DoH) ve DNSSEC desteği.

Bu nedenle, projenin **Quad9** (`9.9.9.9`) altyapısına taşınması, hem engellemeleri aşma hem de kullanıcı verilerini koruma açısından hayati önem taşımaktadır. Bu fork, **güvenli, şifreli ve merkeziyetsiz** bir DNS çözümü sunmayı hedefler.

---

## 🛡️ Nasıl Çalışır?

Proje, iki temel mekanizmayı birleştirerek DPI engellerini aşar:

1.  **DNS Yönlendirme (DNAT):** Tüm DNS sorguları (`UDP/53`), `nftables` kuralları ile **Quad9** sunucularına yönlendirilir. Bu sayede ISP'nin DNS zehirlemesi (spoofing) engellenir.
2.  **Paket Manipülasyonu (DPI Bypass):** HTTPS trafiği, `NFQUEUE` üzerinden yakalanır ve sahte paketler (fake packets) ile parçalara ayrılır (fragmentation). Bu işlem, derin paket incelemesi yapan cihazların trafiği analiz etmesini zorlaştırır ve bağlantının kurulmasını sağlar.

### Teknik Akış
```mermaid
graph LR
    A[İstemci] -->|HTTPS DNS Sorgusu| B(nftables DNAT)
    B -->|Yönlendir| C[Quad9 DNS 9.9.9.9]
    A -->|HTTPS Trafiği| D[NFQUEUE]
    D -->|Parçala + Sahte Paket| E[DPI Cihazı]
    E -->|Karışır| F[Gerçek Sunucu]
🐧 Desteklenen Dağıtımlar

Bu proje, systemd tabanlı modern Linux dağıtımlarında çalışacak şekilde tasarlanmıştır.
Dağıtım Ailesi	Destek Durumu	Notlar
Arch Linux	✅ Tam Destek	CachyOS, Manjaro, EndeavourOS dahil
Ubuntu/Debian	✅ Tam Destek	20.04+, 22.04+, 24.04 LTS
Fedora	✅ Tam Destek	Son sürümler
openSUSE	✅ Tam Destek	Tumbleweed & Leap
CentOS/RHEL	⚠️ Kısmi	Manuel bağımlılık kurulumu gerekebilir

    Not: systemd kullanmayan dağıtımlarda (Artix, Gentoo OpenRC, Alpine) servis dosyasının manuel uyarlanması gerekebilir.

📦 Bağımlılıklar

Kurulum öncesinde sisteminizde aşağıdaki paketlerin bulunması gerekir:
Paket	Açıklama	Kurulum Komutu (Ubuntu/Debian)
build-essential	GCC, Make ve derleme araçları	sudo apt install build-essential
libnetfilter_queue-dev	NFQUEUE kütüphanesi	sudo apt install libnetfilter_queue-dev
libmnl-dev	MNL kütüphanesi	sudo apt install libmnl-dev
libnfnetlink-dev	Netlink kütüphanesi	sudo apt install libnfnetlink-dev
nftables	Firewall kuralları	sudo apt install nftables

Arch Linux için:
sudo pacman -S base-devel libnetfilter_queue nftables
🚀 Kurulum Rehberi
Yöntem 1: Otomatik Kurulum (Önerilen)

    Repoyu klonlayın:
    git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
    cd GoodbyeDPI-Turkey-Linux-

    Bağımlılıkları kurun (Ubuntu/Debian):
    sudo apt update
    sudo apt install -y build-essential libnetfilter_queue-dev libmnl-dev libnfnetlink-dev nftables

    Kurulum scriptini çalıştırın:
    sudo bash service_install_dnsredir_turkey.sh

Script otomatik olarak:

    Derleme araçlarını kontrol eder.
    goodbyedpi binary'sini derler.
    systemd servisini kurar.
    DNS ayarlarını Quad9'e yönlendirir.
    nftables kurallarını yükler.

Yöntem 2: Manuel Derleme

Eğer otomatik kurulum başarısız olursa:
# Bağımlılıkları kur
sudo apt install -y build-essential libnetfilter_queue-dev libmnl-dev libnfnetlink-dev nftables

# Derle
make

# Binary'yi yerleştir
sudo install -Dm755 goodbyedpi /usr/local/bin/goodbyedpi

# Servisi başlat
sudo systemctl enable --now goodbyedpi
🔧 Kullanım ve Yönetim
Servis Kontrolü
# Servis durumunu görüntüle
sudo systemctl status goodbyedpi

# Servisi yeniden başlat
sudo systemctl restart goodbyedpi

# Servisi durdur
sudo systemctl stop goodbyedpi
Logları İzleme
journalctl -u goodbyedpi -f
nftables Kurallarını Görüntüleme
sudo nft list table inet goodbyedpi
Kaldırma
sudo bash service_remove.sh
🧪 Test ve Doğrulama

Kurulum sonrası çalışıp çalışmadığını doğrulamak için:

    DNS Çözümleme Testi:
    dig discord.com +short

    Sonuç: 162.159.x.x (Cloudflare IP) gelmelidir. 195.175.x.x gibi sahte bir IP gelmemelidir.

    Erişim Testi:
    curl -o /dev/null -w "%{http_code}\n" https://discord.com

    Sonuç: 200 veya 301/302 dönmelidir.

    DNS Sunucusu Kontrolü:
    resolvectl status | grep -A3 "DNS Servers"

    Sonuç: 9.9.9.9 ve 149.112.149.112 görülmelidir.

⚙️ Gelişmiş Seçenekler

Farklı ISP'ler veya sorunlar için alternatif scriptler mevcuttur:
Script	Açıklama	Kullanım
service_install_dnsredir_turkey.sh	Varsayılan - Tüm ISP'ler için optimize	sudo bash ...
..._alternative3_superonline.sh	SuperOnline için (TTL=3)	sudo bash ...
..._alternative4_superonline.sh	SuperOnline için (Fragment=5)	sudo bash ...
turkey_dnsredir.sh	Servissiz, tek seferlik test	sudo bash ...

    Not: Alternatif scriptler de Quad9 DNS kullanacak şekilde güncellenmiştir.

🤝 Katkıda Bulunma ve İletişim

Bu proje, topluluk katkılarıyla gelişmeye açık bir açık kaynak projesidir.

    Hata Bildirimi: Issues bölümünden bildirebilirsiniz.
    Kod Katkısı: Pull Request'leriniz memnuniyetle karşılanır.
    Görüş ve Öneriler: Projenin geliştirilmesi için fikirlerinizi bekliyoruz.

    Hatamı görürseniz iletişime geçin:
    Her türlü hata, öneri veya güvenlik açığı bildirimi için lütfen GitHub Issues üzerinden iletişime geçiniz. Katkılarınız, projenin daha güvenli ve erişilebilir olmasına yardımcı olacaktır.

⚖️ Yasal Uyarı ve Lisans

    Kullanım Amacı: Bu araç, yalnızca kendi ağınızda erişim kolaylığı sağlamak ve güvenlik sağlamak amacıyla tasarlanmıştır.
    Yasal Sorumluluk: Kullanıcılar, bu aracı yerel yasalarına uygun şekilde kullanmakla yükümlüdür. Geliştiriciler, aracın kötüye kullanımından sorumlu tutulamaz.
    Lisans: MIT License. Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

🙏 Teşekkürler

    ValdikSS - Orijinal GoodbyeDPI projesi için.
    cagritaskn - Türkiye özelleştirmeleri ve Linux portu için.
    Quad9 - Güvenli ve ücretsiz DNS altyapısı için.

<div align="center">

GoodbyeDPI Turkey - Linux (Quad9 Edition)
Güvenli, Hızlı ve Engelsiz İnternet İçin.

License: MIT Linux Quad9
</div> ```
