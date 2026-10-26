<div align="center">

⚡ GoodbyeDPI Turkey
Linux / Quad9 Edition

Kişisel Linux yapılandırmam. Daha pratik kurulum.

![Linux](https://img.shields.io/badge/PLATFORM-LINUX-24292f?style=for-the-badge&logo=linux&logoColor=white) ![Quad9](https://img.shields.io/badge/DNS-QUAD9-d71921?style=for-the-badge) ![Open Source](https://img.shields.io/badge/OPEN_SOURCE-GITHUB-238636?style=for-the-badge&logo=github&logoColor=white) ![License](https://img.shields.io/badge/LICENSE-MIT-8250df?style=for-the-badge)

<br>

$ sudo apt install ...   →   $ configure   →   $ done

<br>

🚀 Kurulum · ⚙️ Yönetim · 🧪 Test · 🙏 Credits

</div>

01   ▸ Proje hakkında

Bu depo, Linux ortamında kullandığım yapılandırmayı kolaylaştırmak için hazırladığım Quad9 odaklı kişisel bir uyarlamadır.

<details open>
<summary><strong>✨ Projenin hedefleri</strong></summary>

<br>

	Hedef	Açıklama
🐧	Linux	Linux ortamındaki kurulum adımlarını kolaylaştırmak
🌐	Quad9 DNS	Tercih ettiğim DNS hizmetini yapılandırmama dâhil etmek
⚙️	Kolay yönetim	Tekrarlanan manuel işlemleri azaltmak
📦	Dokümantasyon	Kurulum, test ve kaldırma adımlarını anlaşılır tutmak

</details>

[!NOTE]
Projenin gerçek davranışı depodaki kaynak kodlara, kurulum scriptlerine ve sistem yapılandırmasına bağlıdır.
02   ▸ Geliştiricinin notu

<div align="center">

WHY I FORKED THIS PROJECT

</div>

Linux kullanıyorum ve DNS hizmeti olarak Quad9 tercih ediyorum.

Sistemimi yeniden kurduğumda veya dağıtım değiştirdiğimde DNS ayarlarını ve gerekli kurulum adımlarını tekrar tekrar elle yapmak istemedim.

Bu forku, kendi kullandığım yapılandırmayı bir araya getirmek ve kurulum sürecini daha pratik hâle getirmek için oluşturdum.

text
┌──────────────────────────────────────┐
│  USER       Linux kullanıcısı        │
│  DNS        Quad9                    │
│  GOAL       Daha az manuel ayar      │
│  APPROACH   Kişisel yapılandırma      │
└──────────────────────────────────────┘

03   ▸ Kurulum

<div align="center">

INSTALLATION GUIDE

Ubuntu · Debian

</div>

STEP 01 — Depoyu klonla
bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

STEP 02 — Bağımlılıkları yükle
bash
sudo apt update

sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables \
  dnsutils

STEP 03 — Dosyaları incele
bash
ls -la


Depodaki kurulum scriptinin adını belirle. Yönetici yetkisiyle çalıştırmadan önce içeriğini incele:

bash
less ./KURULUM_SCRIPTININ_ADI.sh


KURULUM_SCRIPTININ_ADI.sh bir örnek yer tutucudur; gerçek dosya adıyla değiştirilmelidir.

STEP 04 — Kurulumu tamamla

Depoda bulunan kurulum talimatlarını izle. Scriptin DNS ayarlarını, servisleri ve firewall kurallarını nasıl değiştirdiğini doğruladıktan sonra çalıştır.

[!WARNING]
Yönetici yetkisiyle çalıştırılan scriptler sistem ayarlarını değiştirebilir. Kodunu incelemeden çalıştırma; önemli yapılandırmalarını önceden yedekle.
04   ▸ Servis yönetimi

Aşağıdaki komutlar, kurulumun goodbyedpi adlı bir systemd servisi oluşturması durumunda geçerlidir.

<details>
<summary><strong>▶ Servis durumunu görüntüle</strong></summary>

bash
sudo systemctl status goodbyedpi


</details>

<details>
<summary><strong>↻ Servisi yeniden başlat</strong></summary>

bash
sudo systemctl restart goodbyedpi


</details>

<details>
<summary><strong>■ Servisi durdur</strong></summary>

bash
sudo systemctl stop goodbyedpi


</details>

<details>
<summary><strong>▤ Logları takip et</strong></summary>

bash
sudo journalctl -u goodbyedpi -f


</details>

<details>
<summary><strong>⌕ Servis adını doğrula</strong></summary>

bash
systemctl list-unit-files --type=service | grep -i goodbyedpi


</details>

05   ▸ Test ve doğrulama
🌐 DNS çözümlemesi
bash
dig discord.com +short


Alan adının çözümlenmesi, DNS sorgusunun başarıyla yanıtlandığını gösterir; sorgunun özellikle Quad9 üzerinden yapıldığını tek başına kanıtlamaz.

🛡️ DNS yapılandırması

systemd-resolved kullanıyorsan:

bash
resolvectl status


Quad9 bağlantısını kontrol etmek için:

↗ on.quad9.net — Quad9 bağlantı testi

🔗 HTTPS bağlantısı
bash
curl -sS -o /dev/null \
  -w "HTTP Status: %{http_code}\n" \
  https://discord.com


Sonuç, hedef sunucudan alınan HTTP durum kodudur; ağ ve hizmet koşullarına göre değişebilir.

Quad9 IPv4 adresleri

<div align="center">

PRIMARY DNS	SECONDARY DNS
9.9.9.9	149.112.112.112

Quad9 resmî dokümantasyonu ↗

</div>

[!TIP]
DNS sunucusunun IP adresini yapılandırmak tek başına şifreleme sağlamaz. Şifreli DNS için ayrıca uygun bir istemci ve yapılandırma gerekir.
06   ▸ Kaldırma

Depoda bir kaldırma scripti bulunuyorsa önce adını doğrula ve içeriğini incele.

Örneğin service_remove.sh adlı bir dosya gerçekten mevcutsa:

bash
less ./service_remove.sh


Scriptin yaptığı işlemleri kontrol ettikten sonra, uygun olduğundan eminsen:

bash
sudo bash ./service_remove.sh


Önemli: Kaldırma işleminin DNS ayarlarını, firewall kurallarını ve servis dosyalarını tamamen geri yüklediğini varsayma. İşlem sonrasında sistem yapılandırmanı kontrol et.

07   ▸ Lisans

<div align="center">

📜 MIT LICENSE

Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

![MIT License](https://img.shields.io/badge/License-MIT-238636?style=for-the-badge&logo=opensourceinitiative&logoColor=white)

</div>

Lisansın tam metni ve telif hakkı bildirimleri için LICENSE dosyasını incele.

[!IMPORTANT]
Bu MIT bildirimi, depodaki kodların gerçekten MIT lisansı altında dağıtıldığı ve üçüncü taraf kodların lisans koşullarıyla uyumlu olduğu doğrulandıktan sonra kullanılmalıdır.
08   ▸ Sorumluluk reddi

Bu depo, geliştiricinin kişisel Linux yapılandırma ihtiyacından doğan bağımsız bir teknik çalışmadır. Kaynak projelerin geliştiricileriyle resmî ortaklık veya onay ilişkisi olduğu anlamına gelmez.

Yazılım, yürürlükteki hukukun izin verdiği ölçüde, açık veya örtülü garanti verilmeksizin sunulur. Her sistemde hatasız çalışacağı veya belirli bir sonucu sağlayacağı garanti edilmez.

Kullanıcılar kaynak kodu incelemekten, sistemlerini korumaktan ve yazılımı geçerli mevzuata uygun kullanmaktan sorumludur. Bu açıklama, kanunen sınırlandırılamayan yükümlülükleri ortadan kaldırmaz ve hukuki danışmanlık niteliği taşımaz.

🙏 Credits

Bu projenin temelini oluşturan açık kaynak çalışmalara ve DNS hizmetine teşekkürler.

<details>
<summary><strong>⌘ Kaynak projeleri görüntüle</strong></summary>

<br>

01 — Orijinal proje

ValdikSS / GoodbyeDPI ↗

02 — Türkiye odaklı uyarlama

cagritaskn / GoodbyeDPI-Turkey ↗

03 — Linux portu

salihkahveci090 / GoodbyeDPI-Turkey-Linux ↗

04 — Bu depo

phantasmavaga00 / GoodbyeDPI-Turkey-Linux- ↗

05 — DNS hizmeti

Quad9 ↗

</details>

Proje zinciri
mermaid
flowchart TD
    A["ValdikSS<br/>GoodbyeDPI"]
    B["cagritaskn<br/>GoodbyeDPI-Turkey"]
    C["salihkahveci090<br/>Linux Port"]
    D["phantasmavaga00<br/>Quad9 Edition"]

    A --> B --> C --> D

    style A fill:#24292f,color:#ffffff,stroke:#57606a
    style B fill:#0969da,color:#ffffff,stroke:#0550ae
    style C fill:#8250df,color:#ffffff,stroke:#6639ba
    style D fill:#166534,color:#ffffff,stroke:#22c55e


Kaynak projelerin telif hakları ve lisans koşulları ilgili hak sahiplerine aittir. Bu depo, kişisel kullanım ihtiyaçlarım doğrultusunda hazırlanmış bir uyarlamadır; kaynak projelerin geliştiricileri tarafından resmî olarak desteklendiği veya onaylandığı anlamına gelmez.

<div align="center">

END_OF_README

GoodbyeDPI Turkey · Linux · Quad9 Edition

Made for my own Linux workflow. Shared with the community.

<br>

![GitHub](https://img.shields.io/badge/Explore-Repository-24292f?style=for-the-badge&logo=github)

</div>
