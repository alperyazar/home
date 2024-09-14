---
# License: CC-BY-SA-4.0.
title: "12 Yaşındaki Laptop'uma Hafta Sonu Linux Bakımı"
excerpt: "Debian, Linux Mint, XFCE, Ventoy, ZSH..."
image: /assets/img/24/6.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 6
published: true
tags:
  - tr
---

> Kapak fotosunu DALL-E çizdi. Çalışma ortamıma benzeyen tek şey Ankara'nın da
> bugün güneşli olması...

Hafta sonunun verdiği boşlukla uzun zamandır yapmayı düşündüğüm bir işi yapmaya
karar verdim. Bir yandan da bu blog yazısına yaptıklarımı not alayım dedim.

2012'de aldığım, hala çalışan ve arada bir kullandığım bir Samsung marka
laptop'um var. Zamanına göre iyi bir bilgisayardı, 8G RAM, 1TB HDD ve [Intel
i7-3610QM](https://www.intel.com/content/www/us/en/products/sku/64899/intel-core-i73610qm-processor-6m-cache-up-to-3-30-ghz/specifications.html)
işlemci ([Spectre ve Meltdown](https://meltdownattack.com/) açıkları var diye
kullanmayı bırakacak değilim). Dual Boot olan bu laptop'un bir tarafı Windows
10, bir tarafı ise GNOME masaüstü ile Debian Buster (10). Son Buster sürümü olan
10.13, Eylül 2022'de yayınlandı, bu sürüm Haziran 2024 sonuna kadar ise LTS
projesi kapsamında destekleniyor [^1f]. Anlayacağınız artık yolun sonuna geldim.

> Windows 10'u kullanmak imkansız. Belki şaka gibi gelecek ama laptop'un HDD'si
> o kadar düşük bir performansa sahip ki (+ fazla açılış uygulaması ve optimize
> edilmemiş şeyler olabilir, kabul) Windows 10'un açılıp, kullanılabilir hale gelmesi
> **45 dakika** sürüyor. Evet, tam 45 dakika. Ama hala yanımda götürdüğümde bir
> yerde ihtiyaç olur diye Windows'u tutuyorum. Hoş, kullanması imkansız olsa da.
> Laptop'u zaten çok az kullanıyorum, onda da Debian'ı kullanıyorum.

XFCE gibi masaüstü ortamı yerine GNOME kullanmam garip gelmiş olabilir. GNOME
pek sevilen bir masaüstü ortamı değil (nerede o eski GNOME 2). Özellikle benim
laptop'um gibi kaynağı az olan bilgisayarlar için pek de önerilmez. Kullanıcıya
pek değiştirme seçeneği sunmadığı ve tablet arayüzü gibi bir arayüz sunduğu
söylenir. İşte tam da ben bundan dolayı laptop'ta GNOME kullanıyordum. Çünkü
bu benim ana çalışma bilgisayarım değil, 1-2 adet programı beraber ya açıyorum
ya açmıyorum. Küçük ekranda, o "tabletvari" arayüzü bana kullanışlı geliyordu.
GNOME'ın kendi yazılımlarının birbiriyle çok iyi entegre çalışmasını da seviyorum
(keyring vs). Milletin bayıldığı KDE'yi de ben bir türlü sevemedim. O kadar çok
fazla ayar var ki onlar olunca hepsini kurcalamadan rahat edemiyorum. GNOME adeta
"Kullan geç" diyor. Ama çoklu ekranlı esas kullandığım masaüstü bilgisayarımda da
GNOME çok sade kalıyor, yani kullanışsız oluyordu. Orada da XFCE gibi ortamları
seviyorum. Laptop'taki 8 GB RAM, üzerinde çalışan az sayıda programı düşününce
GNOME açısından problem olmuyor.

Linux dağıtımlarını içeriden upgrade etmeyi pek sevmiyorum. Üniversite yıllarımda
Ubuntu'yu upgrade ederken yaşamış olduğum tramvalarım var. Şu an daha düzgündür
muhtemelen ama birkaç yılda bir format atmak bence bir temizlik yapmak için de
fırsat oluyor.

Bir aralar tam bir **Distrohoper** dım. O Distro senin bu Distro benim atlar
dururdum. Arch Linux gibi dağıtımları sevsem de artık yaşlandım ve dağıtımın
çıkartabileceği problemlerle uğraşmak istemiyorum. Siz Arch Linux ile hiç
problem yaşamamış olabilirsiniz ama ben ne zaman kullansam birkaç aya kalmadan
patlıyorum kardeşim! Projeyi ve arkasındaki mantığı (ve elbette Wiki'sini) çok
sevsem de Virtualbox dışında artık bir yere kurmak istemiyorum. O yüzden
laptop'ta da zamanında Debian tercih etmiştim. İş ve evi ortaklamak için artık
Debian temelli sistemlerden devam ediyorum (Evet, `apt` en iyi paket yöneticisi
olmayabilir ama, hayat işte...). Bir ara laptop'ta Fedora kullanıyordum, o da
çok tatlı ve acayip güncel bir distro.

Bu sefer Linux Mint'e şans vermek istedim. Bir süredir başka bilgisayarlarda
kullanıyorum, hoşuma gidiyor. Bu sefer **Linux Mint 21.3 Virginia Xfce Edition**
kuracağım.

Debian 10 kurarken `dm-crypt` (?) ile disk şifreleme (sonuçta laptop) ve üzerine
LVM vs kurabilmiştim. LVM'i niye kurdum bilmiyorum ama neden olmasın? Mint'te de
benzer bir kurgu oluşturabileceğim bence. Ha bir de laptop'u uykuya yatırmak
için RAM'in sığabileceği bir şifreli Swap alanı. Bunlardan bir miktar
vazgeçebilirim, yükleyicinin advanced mode'unu açıp uğraşasım yok ama içinme
sinmeyecek bir noktaya gelirse yani Linux Mint'te bunları kolayca yapamazsam
Debian 12 basar geçerim. (Direkt öyle mi yapsam acep? Neyse...)

Disk layout'um şöyle bir şey(miş):

```text
NAME             MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINT
sda                8:0    0 931.5G  0 disk
├─sda1             8:1    0   450M  0 part
├─sda2             8:2    0   100M  0 part  /boot/efi
├─sda3             8:3    0    16M  0 part
├─sda4             8:4    0 389.6G  0 part
├─sda5             8:5    0   518M  0 part
├─sda6             8:6    0   550M  0 part
├─sda7             8:7    0     2G  0 part  /boot
├─sda8             8:8    0 493.8G  0 part
│ └─sda8_crypt   254:0    0 493.7G  0 crypt
│   ├─vg-lv_swap 254:1    0  15.3G  0 lvm   [SWAP]
│   └─vg-lv_root 254:2    0 478.5G  0 lvm   /
└─sda9             8:9    0  44.6G  0 part
```

> Bir süredir rolling release gibi Debian `testing` mi kullansam diye düşünmüyor
> da değilim, kullanlar stabilitesini seviyor. Debian'ın `testing` i, Arch'tan
> stabil diyenler var, lol, ama bu çok bel altı!

![Brutal](/assets/img/24/6-brutal.jpg){:.centered .lazyload}

{:.text-align-center}
Goygoyumuzu da yapalım

## Taşınma Hazırlıkları

`~` dizinimi biraz temizledikten sonra taşımak istediğim dosyaları `tar.xz` ile
sıkıştırıyorum ve SFTP üzerinden başka bir bilgisayara alıyorum. Format sonrası
(muhtemelen bir daha asla açmamak üzere) yeni `~` dizinime getireceğim.

## Ventoy

Gelelim kurulum USB belleğimizi hazırlamaya. Bu tarafta kısa bir süredir
[Ventoy](https://www.ventoy.net/) yazılımını kullanıyorum, yeni keşfettim
sayılır. Normalde indirdiğimiz ISO'yu yazıyorduk USB belleğe, `dd` ya da
Windows'ta [Rufus](https://rufus.ie/en/) ile falan. Ventoy'un ise kendi bir
"bootloader"ı var, içine birden fazla ISO atabiliyoruz ve açılışta istediğimiz
ISO'yu seçebiliyoruz. Ayrıca büyük bir bellek ise, kalan kısmını normal USB
bellek gibi de kullanabiliyoruz. Hani derler ya, Linux ile uğraşanlar ya da
sistem yöneticileri yanında USB bellek ile her zaman bir Linux kurulumu ya da
Live ISO taşısınlar diye, işte Ventoy ile tek USB bellek ile yanınızda bir sürü
ISO taşıyabilirsiniz. Kullanmıyorsanız, muhakkak bakın.

{% include youtubePlayer.html id="3PsRxJZTXEY" %}

Bendeki manzara şöyle:

![Ventoy ](/assets/img/24/6-ventoy.png){:.centered .lazyload}

Burada USB belleğiniz normal bir bellek gibi gözüküyor aslında. `ISO` klasörü
içerisine istediğim ISO'ları koyuyorum. Dikkat ederseniz dosyalar açılmış yani
belleğe yazılmış halde değil, internetten indirildiği gibi duruyor.

![Ventoy ](/assets/img/24/6-ventoy-laptop.jpg){:.centered .lazyload}

{:.text-align-center}
Boot ettikten sonra Ventoy'un ekranı geliyor ve kullanmak istediğimiz imajı
seçiyoruz.

## Kurulum

Linux Mint'in kurulumunda merak ettiğim kısım eski disk layout'umu yapıp
yapamayacağımdı ve **yapamadım.** Şifreli bölüm üretebildim ama LVM yapamadım,
ayrıca farklı partition'lar da yaratamadım. Kendisi şifrelediğim diski otomatik
olarak `ext4` olarak formatladı. Formatı değiştirmek mümkündü ama `sdax_crypt`
altında oluşan diskin altına birden fazla partition oluşturamadım. Ben GUI'de
görememiş olabilirim, bakındım ama... Bir dediğim gibi "advanced mode" gibi bir
şeyle de uğraşmak istemedim, var mı onu bile bilmiyorum.

Onun dışında kurulum standard Ubuntu kurulumu.

## Kullanım

Linux Mint'in en güzel özelliği kullanışlı ve tema açısından da güzel bir entegrasyon
sağlanmış iyi bir masasüstü deneyimi sağlaması. Bu konuda da yine beni hoşnut
etti. Benim ekranıma göre biraz yazılar küçük geldi ama bunlar kolayca ayarlanacak
şeyler (ayarlamadım).

**FAKAT** disk layout'umu istediğim gibi yapamadığım için **hibernate**
yapamıyorum. Bunun böyle olabileceğini kurulum sırasında fark ettim fakat
laptop'u çok az kullandığım ve bu kullanımların da çok azında hibernate yaptığım
için (yani kapağı kapatıp, sistemi komple diske kaydetme ve laptop'un gücünü
tamamen kapatabilme) bunu göze alarak kuruluma devam ettim. Ventoy'un sayesinde
diskte Debian olmasına rağmen, ki zamanında Debian kurulumunda bu disk
layout'unu yapabilmiş (gösterdiğim üzere) ve hibernate desteği getirebilmiştim,
hem üşendiğimden (tekrar reboot falan) hem de Linux Mint'i de laptopta biraz
denemek istediğimden devam ettim.

```text
$ lsblk
NAME           MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
sda              8:0    0 931,5G  0 disk
├─sda1           8:1    0   450M  0 part
├─sda2           8:2    0   100M  0 part  /boot/efi
├─sda3           8:3    0    16M  0 part
├─sda4           8:4    0 389,6G  0 part
├─sda5           8:5    0   518M  0 part
├─sda6           8:6    0   550M  0 part
├─sda7           8:7    0     2G  0 part  /boot
├─sda8           8:8    0 493,7G  0 part
│ └─sda8_crypt 253:0    0 493,7G  0 crypt /
└─sda9           8:9    0  44,6G  0 part
sr0             11:0    1  1024M  0 rom
```

{:.text-align-center}
Yeni layout'ta Swap, LVM falan hak getire...

Bana ilginç gelen, Hibernation özelliğinin Mint forumlarında hala istenen
özellik olarak tartışılıyor olması oldu. [^2f] Masaüstü kullanımı (yani server
amaçlı olmayan, laptop dahil) amaçlayan bir dağıtımın böyle bir özelliği bence
desteklemesi gerekiyor. Öte yandan, **Suspend** özelliği var. Burada,
Hibernate'ten farklı olarak laptopun kapağı kapatıldığı zaman (ya da elle bu
moda sokulduğu zaman) bilgisayar uykuya geçerken bilgileri RAM'de "donduruyor."
Ama RAM'in çalışması için, bilgisayarın az da olsa biraz güç tüketmesi
gerekiyor. Laptop güçteyse problem yok, pilden çalışıyorsa yine saatlerce hatta
günlerce bu modda kalabiliyor. Hibernate ise "derin uyku" olarak düşünülebilir.
RAM'e kaydedilmek yerine, diske kaydediliyor bilgiler. Bunun için disk
partition'larının uygun olması gerekiyor (swap alan, şifreli alan vs...). Bu
durumda bilgisayar komple kapatılabiliyor. Bu da teoride sınırsız bir uyku
süresi demek. Bu açıdan düşününce çoğu durumda Suspend yeterli, sonuçta pili
olan bir laptop bu durumda çok rahat saatlerce durabilir. Ama yine de masaüstü
kullanımı hedefleyen bir dağıtımın Hibernate'i "out-of-box" desteklemesi
gerekirdi bence. Sunucu kullanımı hedefleyen dağıtımlar için bu zaten anlamlı
değil.

Suspend ve Hibernate'ten konuşunca, 10 yıl önce yazdığım şu yazı aklıma geldi.
Hey gidi günler...

{% include ax_single.html reccmode="single" reccyear="14" reccaxseq="1" %}

Benim kurduğum Linux Mint XFCE dağtımında laptop prizdeyken ekranı kapatmak
(fiziksel olarak) sadece ekranı kilitliyor, bunu Suspend olarak değiştirdim ve
biraz denedim. Suspend'e giriş çıkışta bir problem görmedim, Wi-Fi dahil.

Laptop'ta olan Realtek entegreli ağ arayüzleri için bir sürücü kurmam gerekmedi.
Debian'da ayrıca kurmuştum fakat bu Debian'ın sadece repo lisans politikası ile
ilgiliydi sanırım, Linux Mint (yani Ubuntu) bu konuda daha "gevşek" olabilir.

```text
$ free -h
               total        used        free      shared  buff/cache   available
Mem:           7,6Gi       1,6Gi       552Mi       300Mi       5,6Gi       5,5Gi
Swap:          2,0Gi          0B       2,0Gi
$ swapon -s
Filename  Type  Size  Used  Priority
/swapfile
```

Bu arada, kurulum sırasında bir Swap alanı oluşturmasam da otomatik olarak
2GB boyutunda `/swapfile` oluşturulmuş. Diskim geniş ve RAM'im görece az
olduğu için ben RAM boyutunda yani 8GB boyutunda bir Swap oluştururdum bu
sistem için ama pek bir uygulama da çalıştırmadığım için buna dokunmayacağım.

Linux Mint'in varsayılan masaüstü ortamı Cinnamon, aynı topluluk tarafından
geliştiriliyor. Bunun dışında MATE ve Xfce de destekleniyor,
[buradan](https://www.linuxmint.com/download.php) bakabilirsiniz. İşin güzel
yani, tüm masaüstü ortamlarının neredeyse aynı görünecek şekilde ayarlanmış
olması. Linux Mint'in yaşattığı masaüstü deneyimi gerçekten güzel. Ubuntu
temelli olması da bir şeyleri kurmak ve uyumluluk açısından iyi bir avantaj
sağlıyor. Ayrıca otomatik sürücü bulması, özellikle NVIDIA kullanıcıları için
bir kolaylık. Benim laptopta da çok eski bir ekran kartı olsa da varsayılan açık
kaynak sürücüden devam ediyorum şimdilik.

Laptop'u pilde çok sık kullansaydım güç tüketimini optimize etmek adına başka
dağıtımlara bakabilir ya da kernel ayarları ile oynayabilirdim. Ama ben neredeyse
hep prizde kullandığım için buraları kurcalamıyorum.

Şöyle bir saflık yaptım: Linux Mint, Ubuntu 22.04 temelli ve Nisan 2027'ye kadar
desteklenecek. Biraz daha bekleseydim ki, Debian 10 Debian LTS projesi tarafından
Haziran 2024'e kadar desteklenecek, yeni LTS sürümü olacak Ubuntu 24.04 temelli
yeni Linux Mint'i kurabilirdim. Bu da muhtemelen 2029'a kadar destekleniyor olacak,
böylece 2 sene daha kazanırdım. Neyse 2027 uzun bir süre, daha 3 yıl var...

Format sonrası kullandığım yazılımları ve temaları kuracağım, birazcık daha
işim var. Belki bu aralar uğraştığım **Buildroot Öğreniyoruz** serisine de
buradan devam ederim? Bilmeyenler için an itibariyle serideki son yazım:

{% include ax_single.html reccmode="single" reccyear="24" reccaxseq="5" %}

İlerleyen zamanlarda karta bir şeyler atmak için SD Card arayüzüne ihtiyacım
olacak. Bu da esas masaüstü çalışma bilgisayarımda yok, bir tek bu laptop'ta var.
Derlenmiş dosyaları taşımak yerine, direkt laptop üzerinde de çalışabilirim belki.
Bir düşüneyim...

Sizin de benim gibi "patates" bilgisayarınız varsa şu videoya bakabilirsiniz:

{% include youtubePlayer.html id="GVfAL1PwXC0" %}

[^1f]: <https://www.debian.org/releases/buster/>
[^2f]: <https://forums.linuxmint.com/viewtopic.php?t=374320>
