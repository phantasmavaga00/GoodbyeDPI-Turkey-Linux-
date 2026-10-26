<div align="center">

GoodbyeDPI Turkey — Linux
QUAD9 EDITION

<p>
<a href="https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-">
<img src="https://img.shields.io/badge/GitHub-Personal_Fork-24292f?style=for-the-badge&logo=github&logoColor=white" alt="GitHub personal fork">
</a>
<a href="https://quad9.net/">
<img src="https://img.shields.io/badge/DNS-Quad9-d71921?style=for-the-badge" alt="Quad9">
</a>
<img src="https://img.shields.io/badge/Platform-Linux-2f81f7?style=for-the-badge&logo=linux&logoColor=white" alt="Linux">
</p>

Kendi Linux ortamım için. Kendi DNS tercihimle. Daha az manuel ayar.

</div>

<table>
<tr>
<td width="50%">

🎯 Projenin amacı

Linux sistemimi yeniden kurduğumda tercih ettiğim DNS yapılandırmasını tekrar tekrar elle yapmak zorunda kalmamak.

</td>
<td width="50%">

🛠️ Geliştirme amacı

Fork'lama, Linux ağ yapılandırması ve kaynak kod üzerinde çalışarak kendimi geliştirmek.

</td>
</tr>
</table>

💻 Proje hakkında

Bu depo, salihkahveci090/GoodbyeDPI-Turkey-Linux projesi temel alınarak kişisel kullanım ihtiyaçlarıma göre düzenlenmektedir.

Linux kullanıyorum ve DNS hizmeti olarak Quad9'u tercih ediyorum. Bu fork'u, kullandığım yapılandırmayı kendi ihtiyaçlarıma uygun hâle getirmek ve günlük kurulum sürecimi kolaylaştırmak için oluşturdum.

<div align="center">

LINUX   /   QUAD9 DNS   /   PERSONAL FORK

</div>

🚀 Kurulum
01 — Depoyu indir
bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-

02 — Gerekli paketleri yükle

Arch Linux / CachyOS:

bash
sudo pacman -S --needed \
  libnetfilter_queue \
  nftables \
  gcc \
  make


Ubuntu / Debian kullanıyorsan paket adları farklı olabilir. Bu dağıtımlarda derleme için gerekli geliştirme paketlerini ayrıca kurmalısın.

03 — Dosyaları kontrol et
bash
ls -la


Depoda bulunan README talimatlarını, kurulum scriptlerini ve varsa Makefile dosyasını incele.

04 — Kurulumu tamamla

Depodaki gerçek kurulum talimatlarını takip et. Scripti yönetici yetkisiyle çalıştırmadan önce içeriğini kontrol et.

Dikkat: Kurulum scriptinin adı ve davranışı mevcut depo içeriğinden doğrulanmalıdır. Bu README, doğrulanmamış bir scriptin kesin olarak bulunduğunu veya bütün ayarları otomatik yaptığını iddia etmez.
⚙️ Servis yönetimi

Kurulum goodbyedpi adında bir systemd servisi oluşturuyorsa:

İşlem	Komut
Durum	sudo systemctl status goodbyedpi
Yeniden başlat	sudo systemctl restart goodbyedpi
Durdur	sudo systemctl stop goodbyedpi
Loglar	sudo journalctl -u goodbyedpi -f

Servisin mevcut olup olmadığını kontrol etmek için:

bash
systemctl list-unit-files --type=service | grep -i goodbyedpi

🌐 DNS kontrolü

DNS çözümlemesini test et:

bash
dig discord.com +short


Etkin DNS yapılandırmasını görüntüle:

bash
resolvectl status


Quad9 bağlantısını doğrulamak için on.quad9.net adresini ziyaret edebilirsin.

Quad9 DNS	IPv4
Birincil	9.9.9.9
İkincil	149.112.112.112

Kaynak: <a href="https://quad9.net/service/service-addresses-and-features/">Quad9 resmî dokümantasyonu</a>.

🧹 Kaldırma

Depodaki kaldırma talimatlarını incele. Bir kaldırma scripti mevcutsa önce içeriğini kontrol et; ardından uygun olduğundan emin olarak çalıştır.

Kaldırma işleminin DNS ayarlarını, firewall kurallarını ve servisleri otomatik olarak geri yüklediğini varsayma.

⚖️ Lisans

MIT License — Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

Lisansın tam metni LICENSE dosyasında bulunmalıdır. Bu bildirim, depodaki kodların ve üçüncü taraf bileşenlerin lisansları kontrol edilerek doğrulanmalıdır.

🛡️ Sorumluluk reddi

Bu depo, kişisel kullanım ve teknik öğrenme amacıyla hazırlanmış bağımsız bir uyarlamadır. Kaynak projelerin geliştiricileriyle resmî ortaklık veya onay ilişkisi bulunduğu anlamına gelmez.

Yazılım, yürürlükteki hukukun izin verdiği ölçüde garanti verilmeksizin sunulur. Kullanıcılar yazılımı kullanırken geçerli mevzuata uymalı ve sistemlerinde yaptıkları değişiklikleri değerlendirmelidir. Bu açıklama, kanunen sınırlandırılamayan sorumlulukları ortadan kaldırmaz.

🙏 Credits
@ValdikSS — GoodbyeDPI
@cagritaskn — GoodbyeDPI-Turkey
@salihkahveci090 — GoodbyeDPI-Turkey-Linux
Quad9 — DNS hizmeti

<div align="center">

GoodbyeDPI Turkey · Linux · Quad9 Edition

Built around my own Linux workflow.

</div>
