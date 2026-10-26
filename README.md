<div align="center">

<img src="https://capsule-render.vercel.app/api?type=venom&height=240&color=0:101820,50:173b35,100:7c3aed&text=GoodbyeDPI%20Turkey&fontColor=ffffff&fontSize=42&fontAlignY=40&desc=LINUX%20%2F%20QUAD9%20EDITION&descSize=18&descAlignY=58&animation=fadeIn" width="100%" alt="GoodbyeDPI Turkey Linux Quad9 Edition"/>

<br>

<a href="https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-">
<img src="https://img.shields.io/badge/PROJECT-PERSONAL_FORK-161b22?style=for-the-badge&logo=github&logoColor=white" alt="Personal fork"/>
</a>
<a href="https://quad9.net/">
<img src="https://img.shields.io/badge/DNS-QUAD9-d71921?style=for-the-badge" alt="Quad9 DNS"/>
</a>
<img src="https://img.shields.io/badge/PLATFORM-LINUX-2f81f7?style=for-the-badge&logo=linux&logoColor=white" alt="Linux"/>
<img src="https://img.shields.io/badge/FOCUS-CONVENIENCE-8957e5?style=for-the-badge" alt="Convenience"/>

<br><br>

Kendi sistemim. Kendi yapılandırmam. Daha kolay kurulum.

Linux kullanımı, Quad9 DNS tercihi ve kişisel geliştirme için hazırlanmış bir açık kaynak uyarlaması.

<br>

<a href="#-proje-hakkinda">PROJE</a>   ◆   <a href="#-kurulum">KURULUM</a>   ◆   <a href="#-kontrol-paneli">TESTLER</a>   ◆   <a href="#-credits">CREDITS</a>

</div>

<table>
<tr>
<td width="33%" align="center">
<h3>🐧 LINUX</h3>
<sub>Günlük kullanım</sub>
</td>
<td width="33%" align="center">
<h3>🌐 QUAD9</h3>
<sub>Tercih ettiğim DNS</sub>
</td>
<td width="33%" align="center">
<h3>⚙️ PERSONAL</h3>
<sub>Kişisel uyarlama</sub>
</td>
</tr>
</table>

🟢 Proje hakkında

Bu forku, Linux kullanırken tercih ettiğim Quad9 DNS yapılandırmasını ve ihtiyaç duyduğum kurulum adımlarını bir araya getirmek için oluşturdum.

Sistemimi her yeniden kurduğumda aynı ayarları elle tekrarlamak yerine, kendi kullanım senaryoma uygun bir depo oluşturmak ve bu süreçte kendimi geliştirmek istiyorum.

<details>
<summary><b>⌁ Projenin kapsamını görüntüle</b></summary>

<br>

Linux ortamındaki kurulum sürecini kolaylaştırmak.
Quad9 DNS tercihini mevcut yapılandırmayla uyumlu hâle getirmek.
Tekrarlanan manuel işlemleri azaltmak.
Kaynak kod üzerinde çalışarak Linux ağ yapılandırmasını öğrenmek.

Bu depo bağımsız bir kişisel fork'tur. Gerçek özellikler, depodaki kod ve yapılandırma dosyalarına bağlıdır.

</details>

💻 Kurulum

<img src="https://img.shields.io/badge/STEP_01-CLONE-238636?style=flat-square" alt="Step 1"/>

Depoyu bilgisayarına indir

bash
git clone https://github.com/phantasmavaga00/GoodbyeDPI-Turkey-Linux-.git
cd GoodbyeDPI-Turkey-Linux-


<img src="https://img.shields.io/badge/STEP_02-DEPENDENCIES-8957e5?style=flat-square" alt="Step 2"/>

Ubuntu / Debian bağımlılıkları

bash
sudo apt update

sudo apt install -y \
  build-essential \
  libnetfilter-queue-dev \
  libmnl-dev \
  libnfnetlink-dev \
  nftables \
  dnsutils


<img src="https://img.shields.io/badge/STEP_03-INSPECT-2f81f7?style=flat-square" alt="Step 3"/>

Kurulum dosyalarını kontrol et

bash
ls -la


Depoda bulunan kurulum talimatlarını takip et. Bir scripti yönetici yetkisiyle çalıştırmadan önce içeriğini incele ve sistemde yapacağı değişiklikleri anla.

⚠️ Not: Kurulum scriptinin dosya adı ve davranışı doğrulanmadan belirli bir komut varsayılmamalıdır.
🛠️ Servis yönetimi

Kurulum goodbyedpi adında bir systemd servisi oluşturuyorsa:

<table>
<tr><th>İşlem</th><th>Komut</th></tr>
<tr>
<td>Durum</td>
<td><code>sudo systemctl status goodbyedpi</code></td>
</tr>
<tr>
<td>Yeniden başlat</td>
<td><code>sudo systemctl restart goodbyedpi</code></td>
</tr>
<tr>
<td>Durdur</td>
<td><code>sudo systemctl stop goodbyedpi</code></td>
</tr>
<tr>
<td>Loglar</td>
<td><code>sudo journalctl -u goodbyedpi -f</code></td>
</tr>
</table>

Servisin gerçekten mevcut olduğunu kontrol etmek için:

bash
systemctl list-unit-files --type=service | grep -i goodbyedpi

📡 Kontrol paneli

<div align="center">

<img src="https://img.shields.io/badge/DNS-RESOLUTION-238636?style=for-the-badge" alt="DNS resolution"/>

</div>

DNS çözümlemesini kontrol et:

bash
dig discord.com +short


Etkin DNS yapılandırmasını görüntüle:

bash
resolvectl status


<div align="center">

<a href="https://on.quad9.net/">
<img src="https://img.shields.io/badge/OPEN-QUAD9_CONNECTION_TEST-d71921?style=for-the-badge" alt="Quad9 connection test"/>
</a>

</div>

HTTPS bağlantısını kontrol et:

bash
curl -sS -o /dev/null \
  -w "HTTP Status: %{http_code}\n" \
  https://discord.com


<details>
<summary><b>🌐 Quad9 DNS adresleri</b></summary>

<br>

Sunucu	IPv4
Birincil	9.9.9.9
İkincil	149.112.112.112

Resmî dokümantasyon: Quad9 Service Addresses.

DNS çözümlemesinin başarılı olması tek başına Quad9 kullanıldığını veya DNS sorgularının şifrelendiğini kanıtlamaz. Bağlantı testi ve etkin ağ yapılandırması ayrıca kontrol edilmelidir.

</details>

🧹 Kaldırma

Depoda bulunan kaldırma talimatlarını izle. Bir kaldırma scripti varsa önce gerçek dosya adını ve içeriğini doğrula.

Örneğin service_remove.sh dosyası mevcutsa:

bash
less ./service_remove.sh


İçeriğini inceledikten sonra uygun olduğundan eminsen:

bash
sudo bash ./service_remove.sh


Kaldırma işleminin tüm DNS ayarlarını, firewall kurallarını ve servisleri otomatik olarak geri yüklediğini varsayma.

⚖️ Lisans

<div align="center">

<img src="https://img.shields.io/badge/LICENSE-MIT-238636?style=for-the-badge&logo=opensourceinitiative&logoColor=white" alt="MIT License"/>

Özgürce kullanabilir, değiştirebilir ve dağıtabilirsiniz.

</div>

Lisansın tam metni için LICENSE dosyasına bakın. MIT lisansı kullanılacaksa dosyanın gerçekten mevcut olduğundan ve kaynak projelerin lisans koşullarıyla uyumun doğrulandığından emin olun.

🛡️ Sorumluluk reddi

Bu depo, geliştiricinin kişisel Linux yapılandırma ihtiyacından doğan bağımsız bir teknik çalışmadır.

Yazılım garanti verilmeksizin sunulur. Kullanıcılar kaynak kodu incelemekten, sistemlerini korumaktan ve yazılımı geçerli mevzuata uygun kullanmaktan sorumludur. Bu açıklama, kanunen sınırlandırılamayan sorumlulukları ortadan kaldırmaz veya hukuki danışmanlık yerine geçmez.

🙏 Credits

Bu projede yararlanılan kaynaklar:

@ValdikSS — GoodbyeDPI
@cagritaskn — GoodbyeDPI-Turkey
@salihkahveci090 — GoodbyeDPI-Turkey-Linux
Quad9 — DNS hizmeti

Kaynak projelerin hakları ve lisans koşulları ilgili sahiplerine aittir. Bu depo bağımsız bir kişisel uyarlamadır.

<div align="center">

<img src="https://capsule-render.vercel.app/api?type=rect&height=100&color=0:101820,100:173b35&text=END_OF_README&fontColor=ffffff&fontSize=22&fontAlignY=50" width="100%" alt="End of README"/>

Made for my own Linux workflow.

</div>
