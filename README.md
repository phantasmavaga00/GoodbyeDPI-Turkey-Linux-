GoodbyeDPI Turkey - Linux (Quad9 Edition)
Discord, YouTube ve ISP engellerine karşı güvenli ve hızlı erişim

Bu proje, Türkiye'deki internet servis sağlayıcıları (ISP) tarafından uygulanan Deep Packet Inspection (DPI) engellemelerini aşmayı amaçlayan, Quad9 DNS altyapısıyla yapılandırılmış bir Linux çözümüdür.

📜 Proje Tarihçesi ve Dayanak

Bu proje, aşağıdaki açık kaynak projeler üzerine kurulmuş çok katmanlı bir geliştirme çalışmasıdır.

Orijinal motor: ValdikSS/GoodbyeDPI — DPI atlatma algoritmasının temelini oluşturur.
Türkiye özelleştirmesi: cagritaskn/GoodbyeDPI-Turkey — Türkiye'ye özgü filtreleme kuralları ve sahte paket yapıları.
Linux portu: salihkahveci090/GoodbyeDPI-Turkey-Linux — Projenin Linux platformuna taşınması; systemd, nftables ve NFQUEUE entegrasyonu.
Quad9 entegrasyonu (bu proje): Linux forkunun Quad9 DNS (9.9.9.9) kullanacak şekilde uyarlanmasını ve yapılandırılmasını hedefler.
Neden Quad9?

Bu fork, DNS yapılandırmasında Quad9 altyapısını kullanmayı hedefler. Tercih edilmesinin başlıca nedenleri şunlardır:

🔒 Güvenlik ve gizlilik: Kötü amaçlı alan adlarına karşı koruma sunan bir DNS hizmetinden yararlanmak.
⚡ Performans ve kararlılık: DNS çözümleme performansını ve bağlantı kararlılığını iyileştirmeyi hedeflemek.
🛡️ Modern standartlar: DNSSEC ve desteklenen şifreli DNS protokolleri gibi güvenlik özelliklerinden yararlanmak.
Not: DNS yönlendirmesi tek başına tüm DNS trafiğini şifrelemez. Bu özelliğin sağlanması için kullanılan DNS istemcisinin ve yapılandırmanın DoT veya DoH gibi şifreli DNS protokollerini gerçekten kullanması gerekir.
🛡️ Nasıl Çalışır?

Proje, DPI atlatma ve DNS yönlendirme mekanizmalarını bir araya getirir.

DNS yönlendirme (DNAT): Yapılandırılan nftables kuralları, UDP/53 üzerinden yapılan DNS sorgularını Quad9 DNS sunucularına yönlendirebilir.
Paket manipülasyonu (DPI bypass): NFQUEUE üzerinden işlenen ağ paketleri, yapılandırılan GoodbyeDPI algoritmaları doğrultusunda değiştirilir. Sahte paketler ve parçalama teknikleri, DPI sistemlerinin trafiği sınıflandırmasını zorlaştırmayı amaçlar.
Teknik akış
mermaid
flowchart LR
    A[İstemci] -->|DNS UDP/53| B[nftables DNAT]
    B -->|DNS sorgusu| C[Quad9 DNS]
    A -->|HTTPS trafiği| D[NFQUEUE]
    D -->|Paket işleme| E[DPI sistemi]
    E -->|İletilen trafik| F[Gerçek sunucu]

Önemli: Diyagram kavramsal akışı gösterir. Gerçek davranış; kullanılan scriptlere, firewall kurallarına ve sistem yapılandırmasına bağlıdır.
🐧 Desteklenen Dağıtımlar

Proje, systemd kullanan Linux dağıtımlarında çalışacak şekilde tasarlanmıştır.

Dağıtım ailesi	Destek durumu	Notlar
Arch Linux	✅ Hedefleniyor	CachyOS, Manjaro ve EndeavourOS dahil
Ubuntu / Debian	✅ Hedefleniyor	Paket adları dağıtım sürümüne göre değişebilir
Fedora	✅ Hedefleniyor	Bağımlılıkların ayrıca kurulması gerekebilir
openSUSE	✅ Hedefleniyor	Tumbleweed ve Leap
CentOS / RHEL	⚠️ Değişken	Manuel bağımlılık kurulumu gerekebilir
Not: Bu tablo hedeflenen uyumluluğu belirtir; tüm dağıtımlarda test edilmiş olunduğu anlamına gelmez. systemd kullanmayan Artix, Gentoo OpenRC ve Alpine gibi sistemlerde servis dosyalarının uyarlanması gerekebilir.
📦 Bağımlılıklar
Ubuntu / Debian

Kurulum öncesinde gerekli paketleri yükleyin:

bash
sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables

Paket	Açıklama
build-essential	GCC, Make ve derleme araçları
libnetfilter-queue-dev	NFQUEUE geliştirme kütüphanesi
libmnl-dev	Netlink yardımcı kütüphanesi
libnfnetlink-dev	Netlink iletişim kütüphanesi
nftables	Linux firewall kuralları
Arch Linux
bash
sudo pacman -Syu
sudo pacman -S --needed base-devel libnetfilter_queue nftables

Not: Diğer dağıtımlarda paket adları ve bağımlılıkların kurulma yöntemi farklı olabilir.
🚀 Kurulum Rehberi
Yöntem 1: Otomatik kurulum (önerilen)

1. Depoyu klonlayın:

bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-


2. Bağımlılıkları yükleyin (Ubuntu / Debian):

bash
sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables


3. Kurulum scriptini çalıştırın:

bash
sudo bash service_install_dnsredir_turkey.sh


Kurulum scriptinin yapılandırmasına bağlı olarak şu işlemler gerçekleştirilebilir:

Derleme araçlarının kontrol edilmesi.
goodbyedpi ikilisinin derlenmesi.
systemd servisinin kurulması.
DNS yönlendirme ayarlarının yapılandırılması.
nftables kurallarının yüklenmesi.
Uyarı: Kurulum scriptini yönetici yetkisiyle çalıştırmadan önce içeriğini inceleyin. Scriptin yaptığı işlemler, depodaki mevcut sürüme bağlıdır.
Yöntem 2: Manuel derleme

Otomatik kurulum başarısız olursa aşağıdaki adımları uygulayabilirsiniz.

1. Bağımlılıkları yükleyin:

bash
sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables


2. Projeyi derleyin:

bash
make


3. Derlenen dosyayı yükleyin:

bash
sudo install -Dm755 goodbyedpi /usr/local/bin/goodbyedpi


4. Servisi etkinleştirin ve başlatın:

bash
sudo systemctl enable --now goodbyedpi

Not: Manuel kurulumun çalışması için projede uyumlu bir systemd servis dosyasının bulunması ve gerekli firewall kurallarının yapılandırılmış olması gerekir. Yalnızca binary dosyasını yüklemek, DNS yönlendirmesini veya DPI atlatma kurallarını otomatik olarak kurmaz.
🔧 Kullanım ve Yönetim
Servis durumunu kontrol etme
bash
sudo systemctl status goodbyedpi

Servisi yeniden başlatma
bash
sudo systemctl restart goodbyedpi

Servisi durdurma
bash
sudo systemctl stop goodbyedpi

Logları canlı izleme
bash
sudo journalctl -u goodbyedpi -f

nftables kurallarını görüntüleme
bash
sudo nft list table inet goodbyedpi

Not: Tablo adı, kullanılan scriptin yapılandırmasına göre değişebilir.
Kaldırma

Projede bulunan kaldırma scriptini çalıştırın:

bash
sudo bash service_remove.sh

Kaldırma işleminden önce scriptin hangi servisleri ve firewall kurallarını kaldırdığını kontrol edin.
🧪 Test ve Doğrulama

Kurulumdan sonra aşağıdaki kontrolleri gerçekleştirebilirsiniz.

1. DNS çözümleme testi
bash
dig discord.com +short


Komut, alan adının çözümlendiği IP adreslerini gösterir. IP adresleri zaman içinde değişebilir ve farklı CDN altyapılarına ait olabilir. Bu nedenle yalnızca belirli bir IP adresi beklemek yerine DNS çözümlemesinin başarılı olduğunu kontrol edin.

2. HTTPS erişim testi
bash
curl -sS -o /dev/null -w "%{http_code}\n" https://discord.com


Başarılı bir bağlantıda HTTP durum kodu alınması beklenir. 200, 301 veya 302 gibi kodlar başarılı bir HTTP yanıtına işaret edebilir; ancak yönlendirme ve hizmet davranışına göre başka kodlar da görülebilir.

3. DNS sunucusu kontrolü

systemd-resolved kullanıyorsanız:

bash
resolvectl status


DNS sunucularını daha kısa görüntülemek için:

bash
resolvectl status | grep -A3 "DNS Servers"


Yapılandırmaya bağlı olarak 9.9.9.9 ve 149.112.112.112 adreslerini görmeniz beklenebilir. Ancak bu adreslerin görünmesi, bütün DNS sorgularının mutlaka bu sunuculardan geçtiğini tek başına kanıtlamaz.

4. Sorun giderme

Bağlantı kurulamıyorsa şu kontrolleri yapın:

Servisin çalıştığını doğrulayın.
Servis loglarını inceleyin.
Gerekli kernel modüllerinin ve NFQUEUE desteğinin kullanılabilir olduğunu kontrol edin.
nftables kurallarının doğru yüklendiğini doğrulayın.
Başka bir VPN, firewall veya DNS hizmetinin kurallarla çakışmadığından emin olun.
⚙️ Gelişmiş Seçenekler

Depoda bulunması durumunda farklı ISP yapılandırmaları için aşağıdaki scriptler kullanılabilir.

Script	Açıklama	Kullanım
service_install_dnsredir_turkey.sh	Varsayılan kurulum yapılandırması	sudo bash service_install_dnsredir_turkey.sh
service_install_dnsredir_turkey_alternative3_superonline.sh	Superonline için alternatif yapılandırma	Dosya adını depodan doğrulayın
service_install_dnsredir_turkey_alternative4_superonline.sh	Superonline için başka bir alternatif	Dosya adını depodan doğrulayın
turkey_dnsredir.sh	Servis kullanmadan DNS yönlendirme testi	sudo bash turkey_dnsredir.sh
Önemli: Alternatif scriptlerin dosya adları ve parametreleri, depodaki gerçek dosyalarla karşılaştırılmalıdır. Bu dosyaların tamamının mevcut olduğu veya Quad9 DNS kullandığı doğrulanmadan çalıştırılmaması önerilir.
🤝 Katkıda Bulunma

Bu proje, topluluk katkılarına açıktır.

Hata bildirimi: GitHub Issues üzerinden hata bildirebilirsiniz.
Kod katkısı: Pull Request göndererek projeye katkıda bulunabilirsiniz.
Görüş ve öneriler: Yeni özellikler, iyileştirmeler ve dokümantasyon önerileri paylaşabilirsiniz.
Güvenlik bildirimleri: Güvenlik açıklarını herkese açık şekilde paylaşmadan önce uygun bir özel bildirim yöntemi tercih edin.

Katkılarınız projenin daha kararlı, güvenli ve erişilebilir olmasına yardımcı olur.

⚖️ Yasal Uyarı ve Lisans
Kullanım amacı: Araç, ağ yapılandırması ve bağlantı sorunlarını gidermek amacıyla sunulmaktadır.
Yasal sorumluluk: Kullanıcılar, aracı yürürlükteki mevzuata ve kullandıkları ağın kurallarına uygun şekilde kullanmakla yükümlüdür.
Güvenlik: Firewall ve DNS ayarlarında değişiklik yapmak ağ bağlantınızı etkileyebilir. Değişikliklerden önce mevcut yapılandırmanızı yedekleyin.
Lisans: Bu deponun lisansı, kök dizindeki LICENSE dosyasıyla doğrulanmalıdır. MIT lisansı kullanılacaksa dosyanın ve kaynak lisanslarının bu kullanıma uygun olduğundan emin olun.
🙏 Teşekkürler

Bu çalışmanın temelini oluşturan projelere ve hizmetlere teşekkürler:

ValdikSS — Orijinal GoodbyeDPI projesi.
cagritaskn — Türkiye özelleştirmeleri.
salihkahveci090 — Linux portu ve temel altyapı.
Quad9 — DNS çözümleme hizmeti.

<div align="center">

GoodbyeDPI Turkey - Linux (Quad9 Edition)

Güvenli, hızlı ve daha erişilebilir internet için.

Linux · Quad9 · DPI

</div>
