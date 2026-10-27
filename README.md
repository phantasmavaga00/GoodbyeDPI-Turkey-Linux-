# GoodbyeDPI Turkey - Linux (Quad9 Edition)

## 📌 Proje Özeti

Bu repo, [ValdikSS/GoodbyeDPI](https://github.com), [cagritaskn/GoodbyeDPI-Turkey](https://github.com) ve [salihkahveci090/GoodbyeDPI-Turkey-Linux](https://github.com) projelerinin türevidir.

Günlük ihtiyaçlarımı karşılamak ve Linux sistem yönetimi konularında kendimi geliştirmek amacıyla bu projeyi fork'ladım. Yaptığım temel değişiklik, projenin varsayılan DNS yapılandırmasını **Yandex DNS** (`77.88.8.8`) yerine **Quad9** (`9.9.9.9`) kullanacak şekilde güncellemek oldu. Bu kapsamda DNS portunu da Quad9'un standart portu olan 53'e uyarladım.

---

## 🐧 Desteklenen Dağıtımlar

| Dağıtım | Durum | Not |
| :--- | :--- | :--- |
| **Ubuntu 20.04+ / Debian 11+ / Mint** | ✅ **Test Edildi** | Kurulum ve çalışması doğrulandı |
| **Arch Linux / Manjaro** | ❓ Test Edilmedi | Orijinal proje bu dağıtımlar için yazıldı |
| **Diğer Dağıtımlar** | ❓ Test Edilmedi | Manuel uyarlama gerekebilir |

---

## 🚀 Kurulum (Ubuntu/Debian/Mint İçin)

Aşağıdaki komutları sırasıyla çalıştırın. Script tüm işlemleri (derleme, servis kurulumu, DNS ayarları) otomatik olarak yapar.

```bash
# 1. Gerekli kütüphaneleri ve derleyiciyi kurun
sudo apt update && sudo apt install -y build-essential libnetfilter_queue-dev libmnl-dev libnfnetlink-dev nftables

# 2. Projeyi klonlayın ve klasöre girin
git clone https://github.com
cd GoodbyeDPI-Turkey-Linux-

# 3. Kurulumu başlatın (root yetkisi gerektirir)
sudo bash service_install_dnsredir_turkey.sh
```

Kurulum tamamlandığında servis arka planda çalışmaya başlar. Herhangi bir ek işlem yapmanıza gerek yoktur.

---

## 🔧 Kullanım & Kontrol

Servis otomatik olarak başlar. Durdurmak veya yeniden başlatmak için aşağıdaki komutları kullanabilirsiniz:

```bash
# Servis durumunu kontrol et
sudo systemctl status goodbyedpi

# Servisi yeniden başlat
sudo systemctl restart goodbyedpi

# Servisi durdur
sudo systemctl stop goodbyedpi
```

### Çalışıp Çalışmadığını Test Edin:

```bash
# DNS sunucusu Quad9 olmalı
resolvectl status | grep -A3 "DNS Servers"

# Discord gerçek IP'ye çözülüyor mu?
dig discord.com +short
```

---

## 🤝 Geri Bildirim

Bu proje kişisel bir öğrenme çalışmasıdır. Hata bulursanız Issue açarak bildirebilirsiniz. Ben de öğrenme sürecindeyim, önerileriniz değerlidir.

---

## ⚖️ Yasal Uyarı

Bu proje kişisel kullanım ve teknik öğrenme amaçlıdır.

* Kullanıcılar yerel yasalara uymakla yükümlüdür.
* Geliştirici kullanım sonuçlarından sorumlu değildir.

---

## 🙏 Teşekkürler

* ValdikSS — Orijinal GoodbyeDPI
* cagritaskn — Türkiye kuralları
* salihkahveci090 — Linux portu
* Quad9 — Güvenli DNS

---

<div align="center">

**GoodbyeDPI Turkey - Linux (Quad9 Edition)**  
Kişisel kullanım için uyarlanmıştır.

**License:** MIT

</div>
