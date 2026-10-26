<div align="center">

🐧 GoodbyeDPI Turkey — Linux
Quad9 Edition

A personal Linux configuration project

<p>
<img src="https://img.shields.io/badge/Platform-Linux-1793D1?style=for-the-badge&logo=linux&logoColor=white" alt="Linux">
<img src="https://img.shields.io/badge/DNS-Quad9-D71921?style=for-the-badge" alt="Quad9">
<img src="https://img.shields.io/badge/Project-Open%20Source-2EA44F?style=for-the-badge&logo=github&logoColor=white" alt="Open Source">
</p>

Bir kez yapılandır, yeniden kurulumlarda aynı işlemleri tekrar tekrar yapmak zorunda kalma.

</div>

🌳 Proje Geçmişi

Bu depo, aşağıdaki projelerden gelen çalışmaları temel alır. Zincir, bilinen kaynak ilişkisini ve bu fork'un amacını özetler.

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

🔗 Kaynak depolar
Orijinal proje: ValdikSS/GoodbyeDPI
Türkiye uyarlaması: cagritaskn/GoodbyeDPI-Turkey
Linux portu: salihkahveci090/GoodbyeDPI-Turkey-Linux
Bu fork: phantasmavaga00/GoodbyeDPI-Turkey-Linux-
Kaynak projeler kendi geliştiricilerine aittir. Bu depo, mevcut kaynak kod ve lisans koşulları doğrultusunda geliştirilmiş kişisel bir uyarlamadır.
💬 Geliştiricinin Notu
Bu fork'u oluşturma amacım oldukça basit: Ben Linux kullanıyorum ve DNS tarafında Quad9 tercih ediyorum.

Linux'u yeniden kurduğumda veya sistemi yeniden yapılandırdığımda DNS ayarlarını ve gerekli kurulum adımlarını her seferinde elle düzenlemek zorunda kalmak istemedim.

Bu nedenle, kullandığım yapılandırmayı Quad9 ile uyumlu hâle getirip kurulum sürecini olabildiğince pratik tutmak istedim.

Bu depo benim kişisel ihtiyacımdan doğan bir düzenleme ve kolaylık çalışmasıdır. 🚀

🎯 Projenin Amacı
🐧 Linux ortamındaki kurulum sürecini kolaylaştırmak.
🌐 Quad9 DNS yapılandırmasını kullandığım kurulumla bir araya getirmek.
⚙️ Tekrarlanan manuel ayar ihtiyacını azaltmak.
📦 Kurulum ve kaldırma adımlarını anlaşılır biçimde belgelemek.
🚀 Hızlı Kurulum

<details open>
<summary><b>📥 1. Depoyu indir</b></summary>

Terminali aç ve şu komutları çalıştır:

bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-


</details>

<details>
<summary><b>📦 2. Bağımlılıkları yükle (Ubuntu / Debian)</b></summary>

bash
sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables


</details>

<details>
<summary><b>⚙️ 3. Kurulumu gerçekleştir</b></summary>

Kurulum scriptini çalıştırmadan önce içeriğini incele:

bash
less service_install_dnsredir_turkey.sh


Ardından kurulumu başlat:

bash
sudo bash service_install_dnsredir_turkey.sh


Scriptin gerekli servisleri ve DNS yapılandırmasını gerçekten oluşturduğunu kontrol et. İşlemler depodaki sürüme göre değişebilir.

</details>

<details>
<summary><b>✅ 4. Durumu kontrol et</b></summary>

bash
sudo systemctl status goodbyedpi


DNS çözümlemesini kontrol etmek için:

bash
dig discord.com +short

Not: dig komutu için sistemde dnsutils paketinin kurulu olması gerekebilir. Servis adı ve DNS sonuçları sistem yapılandırmasına göre değişebilir.

</details>

🔄 Kur ve Unut

Amaç, ilk kurulumdan sonra her Linux kurulumunda aynı DNS ayarlarını elle yapmak zorunda kalmamaktır.

İşlem	Komut
Servis durumunu kontrol et	sudo systemctl status goodbyedpi
Servisi yeniden başlat	sudo systemctl restart goodbyedpi
Logları görüntüle	sudo journalctl -u goodbyedpi -f
Kurulumu kaldır	sudo bash service_remove.sh

Komutlar, depoda ilgili servis ve scriptlerin bulunduğu ve bu adlarla yapılandırıldığı varsayımına dayanır. Kaldırma scriptini çalıştırmadan önce içeriğini kontrol et.

🌐 Quad9 DNS

Bu fork'un hedeflediği varsayılan Quad9 IPv4 DNS adresleri:

Tür	Adres
Birincil DNS	9.9.9.9
İkincil DNS	149.112.112.112

DNS yönlendirmesi ile şifreli DNS aynı şey değildir. DNS trafiğinin şifrelenmesi için ayrıca uygun bir şifreli DNS istemcisi ve yapılandırması gerekir.

⚖️ Lisans ve Sorumlu Kullanım

Bu depo teknik inceleme, Linux yapılandırması ve yazılım geliştirme amacıyla sunulmaktadır.

Kaynak projelerin telif ve lisans koşullarına uyulmalıdır.
Kurulum scriptleri yönetici yetkisiyle çalıştırılmadan önce incelenmelidir.
Kullanıcılar yazılımı yürürlükteki mevzuata ve kullandıkları sistemler üzerindeki yetkilerine uygun biçimde kullanmalıdır.
Bu README herhangi bir hukuki garanti veya profesyonel hukuki görüş oluşturmaz.
Depoda geçerli lisans, kök dizindeki LICENSE dosyasında belirtilmelidir.
🙏 Teşekkürler
ValdikSS
cagritaskn
salihkahveci090
Quad9

<div align="center">

GoodbyeDPI Turkey — Linux (Quad9 Edition)

Linux kurulumumu kendim için kolaylaştırmak amacıyla.

Personal project · Community contributions welcome

</div>
