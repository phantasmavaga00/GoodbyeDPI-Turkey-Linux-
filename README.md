# GoodbyeDPI Turkey - Linux (Quad9 Edition)

> **Kişisel Kullanım ve Öğrenme Amaçlı Bir Fork**  
> Bu proje, günlük internet kullanımımda ihtiyaç duyduğum bir çözümü kendim için uyarlamak ve bu süreçte Linux tarafında kendimi geliştirmek amacıyla fork'ladığım bir çalışmadır.

---

## 📌 Bu Proje Nedir?

Bu repo, aşağıdaki açık kaynak projelerin bir türevidir:

-   **Orijinal Motor:** [ValdikSS/GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI)
-   **Türkiye Kuralları:** [cagritaskn/GoodbyeDPI-Turkey](https://github.com/cagritaskn/GoodbyeDPI-Turkey)
-   **Linux Portu:** [salihkahveci090/GoodbyeDPI-Turkey-Linux](https://github.com/salihkahveci090/GoodbyeDPI-Turkey-Linux-)

Ben bu projeyi **kendi günlük kullanımım** için uyarladım. Amacım yeni bir araç geliştirmek değil; mevcut bir çözümü kendi ihtiyaçlarıma uygun hale getirmek ve bu süreçte Linux sistem yönetimi, derleme süreçleri ve ağ yapılandırması konularında pratik yapmaktı.

---

## 🎯 Neden Fork'ladım?

Kendi kullanımım için şu düzenlemeleri yapmam gerekiyordu:

1.  **DNS Tercihi:** Mevcut Linux portu varsayılan olarak Yandex DNS kullanıyordu. Ben günlük kullanımımda **Quad9** (`9.9.9.9`) tercih ettiğim için tüm DNS yapılandırmasını buna göre güncelledim.
2.  **Port Uyumu:** Yandex'in kullandığı özel port (1253) yerine Quad9'un standart portunu (53) kullanacak şekilde ayarladım.
3.  **Dağıtım Uyumu:** Proje aslen Arch Linux için hazırlanmıştı. Ben Ubuntu/Debian tabanlı sistemlerde çalışacak şekilde gerekli bağımlılıkları ve kurulum adımlarını uyarladım.
4.  **Güvenlik Ayarları:** DNSSEC ve şifreli DNS (DoT) desteğini etkinleştirdim.

Bu değişiklikler, tamamen **kişisel tercihlerim ve öğrenme sürecim** kapsamında yapılmıştır.

---

## 🐧 Hangi Sistemlerde Çalışır?

Bu proje, `systemd` kullanan modern Linux dağıtımlarında çalışacak şekilde tasarlanmıştır:

| Dağıtım | Durum | Not |
|---|---|---|
| Ubuntu / Debian / Mint | ✅ Çalışıyor | Test edildi |
| Arch Linux / Manjaro / CachyOS | ✅ Çalışıyor | Orijinal hedef platform |
| Fedora | ✅ Çalışması beklenir | Bağımlılık isimleri farklı olabilir |
| openSUSE | ✅ Çalışması beklenir | — |
| systemd kullanmayan dağıtımlar | ⚠️ Ek uyarlama gerekir | Servis dosyası elle düzenlenmeli |

---

## 📦 Kurulum

### Gereksinimler

Kurulumdan önce aşağıdaki paketlerin sisteminizde kurulu olması gerekir:

**Ubuntu / Debian / Mint için:**
```bash
sudo apt update
sudo apt install -y build-essential libnetfilter_queue-dev libmnl-dev libnfnetlink-dev nftables

Arch Linux / Manjaro / CachyOS için:
sudo pacman -S --noconfirm base-devel libnetfilter_queue nftables
Kurulum Adımları

    Repoyu klonlayın:
    git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
    cd GoodbyeDPI-Turkey-Linux-

    Bağımlılıkları kurun (yukarıdaki komutlardan sisteminize uygun olanı çalıştırın).

    Kurulum scriptini çalıştırın:
    sudo bash service_install_dnsredir_turkey.sh

Script otomatik olarak şunları yapar:

    Gerekli kaynak kodları derler.
    goodbyedpi binary'sini oluşturur.
    systemd servisini kurar ve etkinleştirir.
    DNS ayarlarını Quad9'e yönlendirir.
    nftables kurallarını yükler.

🔧 Kullanım
Servis Yönetimi
# Durum kontrolü
sudo systemctl status goodbyedpi

# Yeniden başlatma
sudo systemctl restart goodbyedpi

# Durdurma
sudo systemctl stop goodbyedpi
Log Takibi
journalctl -u goodbyedpi -f
Kaldırma
sudo bash service_remove.sh
✅ Kurulumun Çalıştığını Doğrulama

Kurulumdan sonra şu komutlarla kontrol edebilirsiniz:

1. DNS sunucusu kontrolü:
resolvectl status | grep -A3 "DNS Servers"

Çıktıda 9.9.9.9 görünmelidir.

2. DNS çözümleme testi:
dig discord.com +short

Geçerli bir IP adresi dönmelidir.

3. nftables kural kontrolü:
sudo nft list table inet goodbyedpi

dnat ip to 9.9.9.9:53 satırı görünmelidir.
⚙️ Alternatif Kurulum Scriptleri

Farklı ihtiyaçlar için alternatif scriptler mevcuttur:
Script	Açıklama
service_install_dnsredir_turkey.sh	Varsayılan kurulum (önerilen)
service_install_dnsredir_turkey_alternative3_superonline.sh	SuperOnline için alternatif yapılandırma
service_install_dnsredir_turkey_alternative4_superonline.sh	SuperOnline için alternatif yapılandırma
service_install_dnsredir_turkey_alternative5_superonline.sh	SuperOnline için alternatif yapılandırma
turkey_dnsredir.sh	Servissiz, tek seferlik çalıştırma

Tüm scriptler Quad9 DNS kullanacak şekilde güncellenmiştir.
🤝 Geri Bildirim ve İletişim

Bu proje kişisel bir öğrenme çalışmasıdır ve hatalar içerebilir.

    Bir hata fark ederseniz, lütfen Issues bölümünden bildirin.
    Önerileriniz ve geri bildirimleriniz benim için değerlidir.
    Ben de öğrenme sürecindeyim; yapıcı eleştiriler her zaman memnuniyetle karşılanır.

⚖️ Yasal Uyarı

Bu proje, kişisel kullanım ve teknik öğrenme amacıyla hazırlanmıştır.

    Kullanıcılar, bu yazılımı kullanırken geçerli oldukları bölgedeki yürürlükte olan tüm yasa ve düzenlemelere uymakla yükümlüdür.
    Yazılım "olduğu gibi" (as-is) sunulmaktadır; belirli bir amaca uygunluğu konusunda herhangi bir garanti verilmemektedir.
    Geliştirici, yazılımın kullanımından doğabilecek herhangi bir sonuçtan sorumlu tutulamaz.
    Bu proje, hiçbir kurum, kuruluş veya hizmet sağlayıcı ile ilişkili değildir.

🙏 Teşekkürler

Bu projeyi mümkün kılan tüm açık kaynak geliştiricilerine teşekkür ederim:

    ValdikSS — Orijinal GoodbyeDPI projesi
    cagritaskn — Türkiye özelleştirmeleri
    salihkahveci090 — Linux portu
    Quad9 — Güvenli DNS altyapısı

<div align="center">

GoodbyeDPI Turkey - Linux (Quad9 Edition)

Kişisel kullanım için uyarlanmış bir fork.

License: MIT
</div> ```
