🌳 Projenin Kökeni

Bu proje, aşağıdaki açık kaynak çalışmalarını temel alır ve Linux ortamında Quad9 DNS kullanma ihtiyacım doğrultusunda düzenlenmiştir.
mermaid

flowchart TD
    A["ValdikSS / GoodbyeDPI<br/>Orijinal proje"]
    B["cagritaskn / GoodbyeDPI-Turkey<br/>Türkiye odaklı uyarlama"]
    C["salihkahveci090 / GoodbyeDPI-Turkey-Linux<br/>Linux portu"]
    D["GoodbyeDPI Turkey - Linux<br/>Quad9 Edition"]

    A --> B
    B --> C
    C --> D

    style A fill:#24292f,color:#ffffff,stroke:#57606a
    style B fill:#0969da,color:#ffffff,stroke:#0550ae
    style C fill:#8250df,color:#ffffff,stroke:#6639ba
    style D fill:#16803c,color:#ffffff,stroke:#116329

🔗 Kaynak Depolar
Proje	Açıklama
ValdikSS/GoodbyeDPI	Orijinal GoodbyeDPI projesi
cagritaskn/GoodbyeDPI-Turkey	Türkiye odaklı uyarlama
salihkahveci090/GoodbyeDPI-Turkey-Linux	Linux portu
Bu deponun kaynak kodu	Quad9 Edition

    Kaynak projeler ilgili geliştiricilerine aittir. Bu depo, kaynak çalışmalar üzerine yapılan kişisel bir uyarlamadır; kaynak projelerin geliştiricileri tarafından resmî olarak desteklendiği veya onaylandığı anlamına gelmez.

💬 Geliştiriciden

Bu fork'u oluşturma sebebim oldukça basit: Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum.

Linux'u yeniden kurduğumda veya sistemimi yeniden yapılandırdığımda, aynı DNS ayarlarını ve kurulum adımlarını tekrar tekrar elle yapmak istemedim.

Bu nedenle, kendi kullandığım yapılandırmayı Quad9 ile uyumlu hâle getirerek kurulum sürecini daha pratik bir şekilde yönetebilmek için bu depoyu düzenledim.

Kısacası bu proje, kendi kullanım ihtiyacımdan doğan küçük bir kolaylaştırma çalışmasıdır.
🎯 Projenin Amacı

    Linux kurulumunu ve yapılandırmasını kolaylaştırmak.
    Quad9 DNS ayarlarını kullandığım yapılandırmayla bir araya getirmek.
    Tekrarlanan manuel işlemleri azaltmak.
    Kurulum ve kaldırma adımlarını anlaşılır tutmak.

🚀 Hızlı Kurulum
1. Depoyu klonla
bash

git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

2. Gerekli paketleri yükle (Ubuntu / Debian)
bash

sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables

3. Kurulumu başlat

Önce kurulum scriptini incele:
bash

less service_install_dnsredir_turkey.sh

Ardından çalıştır:
bash

sudo bash service_install_dnsredir_turkey.sh

4. Servis durumunu kontrol et
bash

sudo systemctl status goodbyedpi

    Not: Kurulum scriptinin, servis adının ve DNS yapılandırmasının bu depodaki mevcut sürümle eşleştiğini kontrol et. Komutlar Ubuntu/Debian örneğidir; diğer dağıtımlarda paket kurulum adımları değişebilir.
