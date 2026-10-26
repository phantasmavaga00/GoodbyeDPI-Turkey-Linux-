# GoodbyeDPI Turkey - Linux (Quad9 Edition)

> **Kişisel kullanım ve öğrenme amacıyla uyarlanmış bir fork.**  
> Günlük ihtiyaçlarımı karşılamak ve Linux sistem yönetimi konularında kendimi geliştirmek için mevcut projeyi Quad9 DNS altyapısına taşıdım.

---

## 📌 Proje Özeti

Bu repo; [ValdikSS/GoodbyeDPI](https://github.com/ValdikSS/GoodbyeDPI), [cagritaskn/GoodbyeDPI-Turkey](https://github.com/cagritaskn/GoodbyeDPI-Turkey) ve [salihkahveci090/GoodbyeDPI-Turkey-Linux](https://github.com/salihkahveci090/GoodbyeDPI-Turkey-Linux-) projelerinin türevidir.

**Neden Fork'ladım?**  
Kendi kullanımım için şu değişiklikleri yapmak istedim:
- **DNS Değişikliği:** Varsayılan Yandex DNS (`77.88.8.8`) yerine **Quad9** (`9.9.9.9`) tercih ettim.
- **Port Uyumu:** Özel port (1253) yerine standart DNS portu (53) kullandım.
- **Dağıtım Desteği:** Ubuntu/Debian tabanlı sistemlerde çalışacak şekilde bağımlılıkları uyarladım.
- **Güvenlik:** DNSSEC ve şifreli DNS (DoT) desteğini aktif hale getirdim.

Bu değişiklikler tamamen **kişisel tercihlerim ve öğrenme sürecim** kapsamında yapılmıştır.

---

## 🐧 Desteklenen Dağıtımlar

| Dağıtım | Durum |
| :--- | :--- |
| Ubuntu / Debian / Mint | ✅ Test edildi |
| Arch Linux / Manjaro / CachyOS | ✅ Orijinal hedef |
| Fedora / openSUSE | ✅ Çalışması beklenir |
| systemd kullanmayanlar | ⚠️ Elle uyarlama gerekir |

---

## 📦 Kurulum

### 1. Gereksinimleri Kurun

**Ubuntu / Debian:**
```bash
sudo apt update && sudo apt install -y build-essential libnetfilter_queue-dev libmnl-dev libnfnetlink-dev nftables
```

**Arch / Manjaro:**
```bash
sudo pacman -S --noconfirm base-devel libnetfilter_queue nftables
```

### 2. Projeyi Klonlayın ve Çalıştırın
```bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-
sudo bash service_install_dnsredir_turkey.sh
```
*Script otomatik olarak derleme, servis kurulumu ve DNS ayarlarını yapar.*

---

## 🔧 Kullanım & Kontrol

### Servis Yönetimi
```bash
sudo systemctl status goodbyedpi   # Durum
sudo systemctl restart goodbyedpi  # Yeniden başlat
sudo systemctl stop goodbyedpi     # Durdur
```

### Çalışıp Çalışmadığını Test Edin
```bash
# DNS sunucusu Quad9 olmalı
resolvectl status | grep -A3 "DNS Servers"

# Discord gerçek IP'ye çözülüyor mu?
dig discord.com +short
```

---

## ⚙️ Alternatif Scriptler

Farklı ISP yapıları için alternatif scriptler mevcuttur (hepsi Quad9 kullanır):
- `service_install_dnsredir_turkey_alternative3_superonline.sh`
- `service_install_dnsredir_turkey_alternative4_superonline.sh`
- `service_install_dnsredir_turkey_alternative5_superonline.sh`
- `turkey_dnsredir.sh` (Tek seferlik çalıştırma)

---

## 🤝 Geri Bildirim

Bu proje kişisel bir öğrenme çalışmasıdır. Hata bulursanız **Issue** açarak bildirebilirsiniz. Ben de öğrenme sürecindeyim, önerileriniz değerlidir.

---

## ⚖️ Yasal Uyarı

Bu proje kişisel kullanım ve teknik öğrenme amaçlıdır.
- Kullanıcılar yerel yasalara uymakla yükümlüdür.
- Yazılım "olduğu gibi" sunulur, garanti verilmemektedir.
- Geliştirici kullanım sonuçlarından sorumlu değildir.

---

## 🙏 Teşekkürler

- [ValdikSS](https://github.com/ValdikSS) — Orijinal GoodbyeDPI
- [cagritaskn](https://github.com/cagritaskn) — Türkiye kuralları
- [salihkahveci090](https://github.com/salihkahveci090) — Linux portu
- [Quad9](https://quad9.net) — Güvenli DNS

---

<div align="center">

**GoodbyeDPI Turkey - Linux (Quad9 Edition)**  
*Kişisel kullanım için uyarlanmıştır.*

License: [MIT](LICENSE)

</div>
