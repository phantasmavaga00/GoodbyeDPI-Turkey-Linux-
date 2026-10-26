<div align="center">

GoodbyeDPI Turkey — Linux
Quad9 Edition

Linux için kişisel yapılandırma ve kurulum kolaylığı.

![Linux](https://img.shields.io/badge/Platform-Linux-24292f?style=for-the-badge&logo=linux&logoColor=white) ![Quad9](https://img.shields.io/badge/DNS-Quad9-d71921?style=for-the-badge) ![License](https://img.shields.io/badge/License-MIT-16803c?style=for-the-badge)

Daha az manuel ayar. Daha pratik Linux kurulumu.

</div>

İçindekiler
Proje hakkında
Geliştiricinin notu
Gereksinimler
Kurulum
Servis yönetimi
Test ve doğrulama
Kaldırma
Lisans
Sorumluluk reddi
Credits
Proje hakkında

GoodbyeDPI Turkey — Linux (Quad9 Edition), Linux ortamında kullandığım yapılandırmayı kolaylaştırmak amacıyla hazırladığım kişisel bir uyarlamadır.

Projenin temel amacı, tercih ettiğim Quad9 DNS yapılandırmasını kurulum sürecimle bir araya getirerek tekrar tekrar manuel ayar yapma ihtiyacını azaltmaktır.

Temel bileşenler
Linux: Hedef işletim sistemi.
Quad9 DNS: Tercih edilen DNS hizmeti.
nftables: Linux ağ filtreleme altyapısı.
NFQUEUE: Proje tarafından kullanılıyorsa paket işleme mekanizması.
systemd: İlgili servis dosyaları mevcutsa servis yönetimi.

Kullanılan bileşenlerin ve kurulum adımlarının ayrıntıları, deponun mevcut kaynak koduna bağlıdır.

Geliştiricinin notu

Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum.

Sistemimi yeniden kurduğumda veya Linux dağıtımımı değiştirdiğimde, DNS ayarlarını ve gerekli kurulum adımlarını her seferinde yeniden elle yapmak istemedim.

Bu forku, kendi kullandığım yapılandırmayı bir araya getirmek ve kurulum sürecini daha pratik hâle getirmek için oluşturdum.

Kısacası, kişisel bir ihtiyaçtan doğan küçük bir kolaylaştırma çalışması.
Gereksinimler

Kurulum yöntemine bağlı olarak aşağıdaki paketler gerekebilir:

GCC ve Make gibi derleme araçları.
libnetfilter-queue geliştirme kütüphanesi.
libmnl ve libnfnetlink kütüphaneleri.
nftables.
DNS testleri için dig.
Ubuntu / Debian
bash
sudo apt update
sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables \
  dnsutils


Diğer dağıtımlarda paket adları ve kurulum yöntemleri farklı olabilir.

Kurulum
1. Depoyu klonla
bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

2. Dosyaları kontrol et
bash
ls -la


Depodaki kurulum scriptinin adını belirle. Yönetici yetkisiyle çalıştırmadan önce scriptin içeriğini incele ve hangi sistem ayarlarını değiştirdiğini kontrol et.

3. Kurulumu gerçekleştir

Depoda bulunan kurulum talimatlarını takip et. Kurulum scriptinin DNS ayarlarını, servis dosyalarını ve firewall kurallarını nasıl yapılandırdığını doğrulamadan otomatik olarak doğru çalışacağını varsayma.

Güvenlik notu: Yönetici yetkisiyle çalıştırılan scriptler sistem yapılandırmasını değiştirebilir. Çalıştırmadan önce kodu incele ve önemli ayarlarını yedekle.
Servis yönetimi

Kurulum sonucunda goodbyedpi adında bir systemd servisi oluşturulmuşsa aşağıdaki komutlar kullanılabilir.

Servis durumunu görüntüle:

bash
sudo systemctl status goodbyedpi


Servisi yeniden başlat:

bash
sudo systemctl restart goodbyedpi


Servisi durdur:

bash
sudo systemctl stop goodbyedpi


Logları görüntüle:

bash
sudo journalctl -u goodbyedpi -f


Servis adını doğrulamak için:

bash
systemctl list-unit-files --type=service | grep -i goodbyedpi


Bu komutlar, ilgili servisin sistemde gerçekten bulunması durumunda geçerlidir.

Test ve doğrulama
DNS çözümlemesi
bash
dig discord.com +short


Bu komut, alan adının çözümlenip çözümlenmediğini kontrol eder. Tek başına sorgunun Quad9 üzerinden yapıldığını kanıtlamaz.

DNS yapılandırması

systemd-resolved kullanılıyorsa:

bash
resolvectl status


Quad9 kullanımını kontrol etmek için on.quad9.net adresini de ziyaret edebilirsin.

HTTPS bağlantısı
bash
curl -sS -o /dev/null -w "%{http_code}\n" https://discord.com


Dönen HTTP durum kodu, hedef hizmetten alınan yanıtı gösterir. Sonuçlar ağ koşullarına ve hedef hizmetin durumuna göre değişebilir.

Quad9 DNS adresleri
Tür	IPv4 adresi
Birincil DNS	9.9.9.9
İkincil DNS	149.112.112.112

Resmî kaynak: Quad9 — Service Addresses.

DNS sunucusu adresi kullanmak tek başına DNS sorgularının şifrelendiği anlamına gelmez. Şifreleme için ayrıca uygun bir istemci ve yapılandırma gerekir.

Kaldırma

Depoda bir kaldırma scripti bulunuyorsa önce dosya adını ve içeriğini doğrula.

Scriptin hangi servisleri, DNS ayarlarını ve firewall kurallarını değiştirdiğini incele. Ardından depodaki kaldırma talimatlarını takip et.

Kaldırma işleminin tüm ayarları otomatik olarak geri yüklediğini varsayma. İşlem sonrasında DNS yapılandırmasını ve servis durumunu kontrol et.

Lisans

MIT License — Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

Lisans koşulları ve telif hakkı bildirimleri için depodaki LICENSE dosyasını inceleyin.

Not: Bu lisans bildirimi, depodaki kodların gerçekten MIT lisansı altında dağıtıldığı ve kullanılan üçüncü taraf bileşenlerin lisanslarıyla uyumlu olduğu doğrulandıktan sonra kullanılmalıdır.
Sorumluluk reddi

Bu depo, geliştiricinin kişisel Linux yapılandırma ihtiyacından doğan bağımsız bir teknik çalışmadır. Kaynak projelerin geliştiricileriyle resmî bir ortaklık veya onay ilişkisi bulunduğu anlamına gelmez.

Yazılım, yürürlükteki hukukun izin verdiği ölçüde, açık veya örtülü garanti verilmeksizin sunulur. Her sistemde hatasız çalışacağı veya belirli bir sonucu sağlayacağı garanti edilmez.

Kullanıcılar yazılımı çalıştırmadan önce kaynak kodu incelemeli, sistemlerini korumalı ve geçerli mevzuata uygun hareket etmelidir. Bu açıklama, kanunen sınırlandırılamayan sorumlulukları ortadan kaldırmaz ve hukuki danışmanlık niteliği taşımaz.

Credits

Bu projenin oluşmasına katkı sağlayan açık kaynak projelerin geliştiricilerine ve topluluğa teşekkürler.

Proje	Katkı
ValdikSS/GoodbyeDPI	Orijinal proje
cagritaskn/GoodbyeDPI-Turkey	Türkiye odaklı uyarlama
salihkahveci090/GoodbyeDPI-Turkey-Linux	Linux portu
Quad9	DNS hizmeti

Bu depo, yukarıdaki çalışmaların üzerine kişisel kullanım ihtiyaçlarım doğrultusunda hazırlanmış bir uyarlamadır. Kaynak projelerin telif hakları ve lisans koşulları ilgili hak sahiplerine aittir.

<div align="center">

GoodbyeDPI Turkey — Linux · Quad9 Edition

Kendi Linux kurulumumu kolaylaştırmak için.

</div>
