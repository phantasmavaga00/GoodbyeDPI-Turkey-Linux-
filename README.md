 <div align="center">
🐧 GoodbyeDPI Turkey
Linux · Quad9 Edition

Linux için kişisel DNS yapılandırması ve kurulum kolaylığı

![Linux](https://img.shields.io/badge/Platform-Linux-1793D1?style=flat-square&logo=linux&logoColor=white) ![DNS](https://img.shields.io/badge/DNS-Quad9-D71921?style=flat-square) ![GitHub](https://img.shields.io/badge/Hosted%20on-GitHub-181717?style=flat-square&logo=github)

<br>

Kurulum · Proje geçmişi · Geliştirici notu

</div>
🌳 Proje geçmişi

Bu depo, aşağıdaki açık kaynak çalışmalarından gelen proje zincirinin devamında, kendi Linux ve Quad9 kullanım ihtiyacım için düzenlenmiştir.
mermaid

flowchart TD
    A["ValdikSS<br/>GoodbyeDPI"]
    B["cagritaskn<br/>GoodbyeDPI-Turkey"]
    C["salihkahveci090<br/>GoodbyeDPI-Turkey-Linux"]
    D["phantasmavaga00<br/>Quad9 Edition"]

    A --> B --> C --> D

    style A fill:#24292f,color:#fff,stroke:#57606a
    style B fill:#0969da,color:#fff,stroke:#0550ae
    style C fill:#8250df,color:#fff,stroke:#6639ba
    style D fill:#16803c,color:#fff,stroke:#116329

<details>
<summary><strong>🔗 Kaynak depoları görüntüle</strong></summary>

    ValdikSS/GoodbyeDPI — Orijinal proje.
    cagritaskn/GoodbyeDPI-Turkey — Türkiye odaklı uyarlama.
    salihkahveci090/GoodbyeDPI-Turkey-Linux — Linux portu.
    phantasmavaga00/GoodbyeDPI-Turkey-Linux- — Bu depo.

Kaynak kodların telif hakları ve lisansları ilgili hak sahiplerine aittir. Fork ilişkileri ve kullanılan bileşenlerin lisansları depo geçmişi üzerinden doğrulanmalıdır.

</details>
💬 Neden bu fork?

    Geliştiricinin notu

Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum.

Sistemi yeniden kurduğumda veya Linux dağıtımımı değiştirdiğimde, DNS ayarlarını ve gerekli kurulum adımlarını her seferinde yeniden yapmak istemedim.

Bu depoyu, kendi kullandığım yapılandırmayı Quad9 ile bir araya getirmek ve kurulum sürecini daha pratik hâle getirmek için oluşturdum.

Kısacası: Kendi ihtiyacım, kendi yapılandırmam, daha kolay kurulum.
✨ Neler amaçlanıyor?

<details open>
<summary><strong>🐧 Linux kurulumu</strong></summary>

Linux ortamındaki kurulum adımlarını tek bir yerde toplamak ve tekrar eden manuel işlemleri azaltmak.

</details>

<details>
<summary><strong>🌐 Quad9 DNS</strong></summary>

Tercih ettiğim Quad9 DNS yapılandırmasını kurulum sürecine dâhil etmek.

</details>

<details>
<summary><strong>⚙️ Kolay yönetim</strong></summary>

Servis durumunu kontrol etme, logları görüntüleme ve kaldırma adımlarını anlaşılır hâle getirmek.

</details>
🚀 Kurulum
1 · Depoyu indir
bash

git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

2 · Bağımlılıkları yükle

Ubuntu / Debian:
bash

sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables \
  dnsutils

3 · Kurulum scriptini incele

Yönetici yetkisiyle çalıştırmadan önce scriptin içeriğini kontrol et:
bash

less service_install_dnsredir_turkey.sh

4 · Kurulumu çalıştır
bash

sudo bash service_install_dnsredir_turkey.sh

Kurulum scriptinin gerçekten oluşturduğu servisleri ve DNS ayarlarını kontrol et. Scriptin davranışı depo sürümüne göre değişebilir.
5 · Durumu doğrula
bash

sudo systemctl status goodbyedpi

DNS çözümlemesini test et:
bash

dig discord.com +short

    Not: Bu komutlar Ubuntu/Debian ve ilgili servis yapılandırması için örnektir. Kullandığın dağıtımda paketler veya servis adı farklı olabilir.

🔧 Servis yönetimi

<details>
<summary><strong>Servis komutları</strong></summary>

Servis durumunu görüntüle:
bash

sudo systemctl status goodbyedpi

Yeniden başlat:
bash

sudo systemctl restart goodbyedpi

Durdur:
bash

sudo systemctl stop goodbyedpi

Logları takip et:
bash

sudo journalctl -u goodbyedpi -f

</details>

<details>
<summary><strong>Kurulumu kaldır</strong></summary>

Kaldırma scripti depoda mevcutsa, içeriğini kontrol ettikten sonra çalıştır:
bash

sudo bash service_remove.sh

</details>
🌐 Quad9 DNS

Bu yapılandırmada hedeflenen standart Quad9 IPv4 adresleri:

<div align="center">
Birincil DNS	İkincil DNS
9.9.9.9	149.112.112.112

</div>

DNS yönlendirmesi tek başına şifreleme sağlamaz. Şifreli DNS için ayrıca uygun istemci ve yapılandırma gerekir.
⚖️ Lisans

Bu depo, kaynak projelerden alınan veya uyarlanan kodlar içerebilir. Her bileşenin lisansı kendi koşullarına tabidir.

Lisans bilgileri için depodaki LICENSE dosyasını ve kaynak projelerin lisanslarını inceleyin. Tüm bileşenlerin lisans uyumluluğu doğrulanmadan deponun tamamı için belirli bir lisans iddiasında bulunulmamalıdır.
🛡️ Sorumluluk reddi

Bu proje, geliştiricinin kişisel Linux yapılandırma ihtiyacından doğan bağımsız bir teknik çalışmadır. Kaynak projelerin geliştiricileriyle resmî bir ortaklık veya onay ilişkisi olduğu anlamına gelmez.

Yazılım, yürürlükteki hukukun izin verdiği ölçüde, açık veya örtülü garanti olmaksızın mevcut hâliyle sunulur. Her sistemde sorunsuz çalışacağı, belirli bir performans sağlayacağı veya belirli bir amaca uygun olacağı garanti edilmez.

Kullanıcılar yazılımı çalıştırmadan önce kaynak kodu incelemeli, sistemlerini yedeklemeli ve geçerli mevzuata uygun hareket etmelidir. Geliştiricinin sorumluluğu, yürürlükteki hukuk kapsamında sınırlandırılamayan yükümlülükler bakımından ortadan kalkmaz.

Bu metin hukuki danışmanlık veya hukuki sorumluluktan muafiyet garantisi değildir.

<div align="center">
🐧 GoodbyeDPI Turkey · Linux · Quad9

Kendi Linux kurulumumu kolaylaştırmak için geliştirdiğim kişisel proje.

Kaynak geliştiricilere ve açık kaynak topluluğuna teşekkürler.

</div>
