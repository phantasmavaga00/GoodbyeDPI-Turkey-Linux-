 <div align="center">
> GoodbyeDPI_Turkey_Linux
[ QUAD9 EDITION ]

Linux / Networking / DNS

![Linux](https://img.shields.io/badge/OS-Linux-24292f?style=flat-square&logo=linux) ![DNS](https://img.shields.io/badge/DNS-Quad9-d71921?style=flat-square) ![GitHub](https://img.shields.io/badge/Source-GitHub-24292f?style=flat-square&logo=github)

Daha az manuel ayar. Daha pratik Linux kurulumu.

</div>
01 // PROJECT_ORIGIN

Bu projenin kaynak zinciri:
mermaid

flowchart TD
    A["ValdikSS / GoodbyeDPI"]
    B["cagritaskn / GoodbyeDPI-Turkey"]
    C["salihkahveci090 / Linux Port"]
    D["phantasmavaga00 / Quad9 Edition"]

    A --> B --> C --> D

    style A fill:#24292f,color:#fff,stroke:#484f58
    style B fill:#24292f,color:#58a6ff,stroke:#58a6ff
    style C fill:#24292f,color:#bc8cff,stroke:#bc8cff
    style D fill:#0d2818,color:#3fb950,stroke:#3fb950

<details>
<summary><code>cat sources.txt</code></summary>

    ValdikSS/GoodbyeDPI
    cagritaskn/GoodbyeDPI-Turkey
    salihkahveci090/GoodbyeDPI-Turkey-Linux
    phantasmavaga00/GoodbyeDPI-Turkey-Linux-

</details>
02 // WHY_THIS_FORK
text

$ whoami
Linux user

$ preferred_dns
Quad9

Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum.

Sistemi yeniden kurduğumda DNS ayarlarını ve kurulum adımlarını tekrar tekrar elle yapmak istemedim. Bu fork'u, kendi kullandığım yapılandırmayı bir araya getirip kurulum sürecini kolaylaştırmak için oluşturdum.

    Kişisel bir ihtiyaçtan doğan, Linux odaklı bir yapılandırma çalışmasıdır.

03 // QUICK_START
1. Depoyu indir
bash

git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

2. Bağımlılıkları yükle

Ubuntu / Debian:
bash

sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables

3. Kurulum dosyasını kontrol et
bash

ls

Depoda bulunan kurulum scriptinin adını doğrula. Çalıştırmadan önce içeriğini incele:
bash

less ./SCRIPT_ADI.sh

SCRIPT_ADI.sh yerine depodaki gerçek dosya adını yaz. Scriptin Quad9 DNS ayarlarını ve gerekli servisleri gerçekten yapılandırdığını kontrol ettikten sonra çalıştır.
04 // DNS_CONFIGURATION

Quad9 standart IPv4 DNS adresleri:
text

PRIMARY   = 9.9.9.9
SECONDARY = 149.112.112.112

DNS yönlendirmesi tek başına şifreleme sağlamaz. Şifreli DNS için ayrıca uygun istemci ve yapılandırma gerekir.
05 // DISCLAIMER

Bu depo kişisel bir teknik çalışmadır. Kaynak projeler ilgili geliştiricilerine aittir; bu depo resmî destek veya onay anlamına gelmez.

Yazılım herhangi bir çalışma garantisi verilmeksizin sunulur. Kullanıcılar kodu incelemekten, sistemlerini korumaktan ve yazılımı geçerli mevzuata uygun kullanmaktan sorumludur. Bu açıklama, kanunen doğabilecek sorumlulukları ortadan kaldırmaz.

Kaynak kodların lisans koşullarını ilgili depolardan ve bu deponun LICENSE dosyasından kontrol edin.

<div align="center">
text

[ END_OF_README ]

Built for my own Linux workflow. Shared for the community.

</div>
