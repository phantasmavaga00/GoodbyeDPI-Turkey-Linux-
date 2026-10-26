<div align="center">
⚡ GoodbyeDPI Turkey — Linux
QUAD9 EDITION

<p>
  <img src="https://img.shields.io/badge/PLATFORM-LINUX-24292f?style=for-the-badge&logo=linux&logoColor=white" alt="Linux">
  <a href="https://quad9.net/"><img src="https://img.shields.io/badge/DNS-QUAD9-d71921?style=for-the-badge" alt="Quad9 DNS"></a>
  <img src="https://img.shields.io/badge/PROJECT-PERSONAL_FORK-8250df?style=for-the-badge" alt="Personal fork">
</p>

Kendi Linux ortamım. Kendi DNS tercihim. Daha pratik kurulum.

Kurulum · Yönetim · Testler · Credits

</div>

<table>
<tr>
<td align="center" width="33%">
<h3>🐧 Linux</h3>
<sub>Günlük kullanım</sub>
</td>
<td align="center" width="33%">
<h3>🌐 Quad9</h3>
<sub>DNS tercihim</sub>
</td>
<td align="center" width="33%">
<h3>⚙️ Open Source</h3>
<sub>Kişisel geliştirme</sub>
</td>
</tr>
</table>
🖥️ Proje hakkında

Bu depo, salihkahveci090/GoodbyeDPI-Turkey-Linux projesinden fork edilerek kişisel kullanım ihtiyaçlarıma göre düzenlenmektedir.

Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum. Sistemimi yeniden kurduğumda aynı ayarları tekrar tekrar elle yapmak istemediğim için bu forku oluşturdum.

Amacım, günlük kullanımımı kolaylaştırırken Linux ağ yapılandırması ve açık kaynak geliştirme konusunda kendimi geliştirmek.
✨ Projenin odağı

    🐧 Linux ortamında kişisel yapılandırma.
    🌐 Quad9 DNS tercihi.
    ⚙️ Tekrarlanan manuel ayarları azaltma.
    📚 Kaynak kod üzerinde çalışarak öğrenme ve geliştirme.

    Bu depo bağımsız bir kişisel uyarlamadır. Gerçek özellikler, kullanılan kaynak kodlara ve yapılandırma dosyalarına bağlıdır.

🚀 Kurulum
01 — Depoyu klonla
bash

git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

02 — Bağımlılıkları yükle

Arch Linux / CachyOS:
bash

sudo pacman -S --needed \
  libnetfilter_queue \
  nftables \
  gcc \
  make

Ubuntu / Debian için gerekli derleme ve ağ kütüphanelerinin geliştirme paketlerini dağıtımının paket yöneticisi üzerinden yükle.
03 — Depo içeriğini kontrol et
bash

ls -la

Kurulum scriptinin ve varsa Makefile dosyasının gerçekten mevcut olduğunu kontrol et. Scripti yönetici yetkisiyle çalıştırmadan önce içeriğini incele.
04 — Kurulumu tamamla

Depodaki gerçek kurulum talimatlarını izle. DNS yapılandırmasını, servis dosyalarını ve firewall kurallarını değiştiren işlemleri çalıştırmadan önce ne yaptıklarını doğrula.

    ⚠️ Kurulum scriptinin adı ve davranışı doğrulanmadan belirli bir komutun mevcut olduğu varsayılmamalıdır.

⚙️ Servis yönetimi

Kurulum sonucunda goodbyedpi adlı bir systemd servisi oluşturulmuşsa aşağıdaki komutlar kullanılabilir.
İşlem	Komut
Durum	sudo systemctl status goodbyedpi
Yeniden başlat	sudo systemctl restart goodbyedpi
Durdur	sudo systemctl stop goodbyedpi
Loglar	sudo journalctl -u goodbyedpi -f

Servis adını doğrulamak için:
bash

systemctl list-unit-files --type=service | grep -i goodbyedpi

🧪 Test ve doğrulama
DNS çözümlemesi
bash

dig discord.com +short

Etkin DNS yapılandırması
bash

resolvectl status

HTTPS bağlantısı
bash

curl -sS -o /dev/null \
  -w "HTTP Status: %{http_code}\n" \
  https://discord.com

Quad9 bağlantı kontrolü

<div align="center">

<a href="https://on.quad9.net/">
<img src="https://img.shields.io/badge/VERIFY-QUAD9_CONNECTION-d71921?style=for-the-badge" alt="Verify Quad9 connection">
</a>

<br>
Quad9 DNS	IPv4 adresi
Birincil	9.9.9.9
İkincil	149.112.112.112

Kaynak: <a href="https://quad9.net/service/service-addresses-and-features/">Quad9 resmî dokümantasyonu</a>.

</div>

DNS çözümlemesinin başarılı olması, sorgunun mutlaka Quad9 üzerinden yapıldığını veya şifrelendiğini tek başına kanıtlamaz. Etkin DNS yapılandırmasını ve bağlantı testini ayrıca kontrol et.
🧹 Kaldırma

Depodaki kaldırma talimatlarını incele. Bir kaldırma scripti bulunuyorsa adını ve içeriğini doğrula.

Scriptin hangi servisleri, DNS ayarlarını ve firewall kurallarını değiştirdiğini kontrol etmeden çalıştırma. Kaldırma sonrasında sistem yapılandırmasını yeniden doğrula.
📜 Lisans

<div align="center">

<img src="https://img.shields.io/badge/LICENSE-MIT-238636?style=for-the-badge&logo=opensourceinitiative&logoColor=white" alt="MIT License">

MIT License — Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

</div>

Lisansın tam metni LICENSE dosyasında bulunmalıdır. MIT lisansını kullanmadan önce kaynak kodların ve üçüncü taraf bileşenlerin lisans koşullarını doğrula.
🛡️ Sorumluluk reddi

Bu depo, kişisel kullanım ve teknik öğrenme amacıyla hazırlanmış bağımsız bir uyarlamadır. Kaynak projelerin geliştiricileriyle resmî bir ortaklık veya onay ilişkisi bulunduğu anlamına gelmez.

Yazılım, yürürlükteki hukukun izin verdiği ölçüde garanti verilmeksizin sunulur. Kullanıcılar kaynak kodu incelemekten, sistemlerini korumaktan ve yazılımı geçerli mevzuata uygun kullanmaktan sorumludur. Bu açıklama, kanunen sınırlandırılamayan sorumlulukları ortadan kaldırmaz ve hukuki danışmanlık niteliği taşımaz.
🙏 Credits

    @ValdikSS — GoodbyeDPI
    @cagritaskn — GoodbyeDPI-Turkey
    @salihkahveci090 — GoodbyeDPI-Turkey-Linux
    Quad9 — DNS hizmeti

Kaynak projelerin telif hakları ve lisans koşulları ilgili sahiplerine aittir. Bu depo kişisel ihtiyaçlar doğrultusunda hazırlanmış bağımsız bir uyarlamadır.

<div align="center">

GoodbyeDPI Turkey · Linux · Quad9 Edition

Built for my own Linux workflow.

</div>
