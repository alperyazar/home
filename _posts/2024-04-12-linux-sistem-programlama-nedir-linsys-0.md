---
# License: CC-BY-SA-4.0.
title: "Linux Sistem Programlama nedir? + SSS + Kaynaklar - Linux SYS - 0"
excerpt: "Linux Sistem Programlama nedir? ve yazı serisinin tanıtımı. İlgili kaynaklar"
image: /assets/img/24/12.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 12
published: true
tags:
  - tr
---

Bu sayfada Linux Sistem Programlama ile ilgili çeşitli kavramları ve bazı sık
sorulan soruları (SSS) anlatmaya çalışacağım. Hadi başlayalım!

## Sistem Programlama nedir?

Linux Sistem Programlama (Linux System Programming) kavramına bakmadan önce
dilerseniz *Sistem Programlama* nedir, ona bir bakalım.

Sistem programlama, *klasik* yani çoğu programlama işinin aksine donanıma daha
yakın şekilde çalışacak programların yazılması eylemidir. Sistem programlama
yapan kişilerin donanımı, *uygulama programı* yazan kişilere göre genelde daha
iyi bilmesi gerekmektedir. Uygulama programları genel olarak kullanıcı ile
doğrudan etkileşime girer iken sistem programları doğrudan kullanıcı ile
etkileşime girmezler, onun yerine uygulama programları gibi diğer programlara
hizmet verirler. En önemli sistem programlarından biri **işletim sistemleri
(OS)** dir. İşletim sistemleri, uygulama geliştiren programcıları donanımın
karmaşıklığından soyutlar. Sistem programları tipik olarak az kaynak tüketen,
bellek tüketimi ya da işlemci kullanımı (CPU cycle) açısından verimli olan
programlardır. İşletim sistemi üzerinde koşan birçok sistem programı
bulunmaktadır. Bu programlar genelde doğrudan ya da standart C kütüphanesi gibi
çok *ince* bir kütüphane katmanı ile işletim sisteminin çekirdeği ile konuşarak
çalışırlar. **Derleyiciler, gömülü yazılımlar, antivirüsler, hypervisor
yazılımları** ya da **container runtime** yazılımları sistem programlarına birer
örnektir. Bu yazılımlar genelde **Assembly, C, C++** gibi düşük seviyeli ya da
**Rust** gibi bu tarz amaçlar için oluşturulmuş modern dillerde yazılırlar.

## Linux Sistem Programlama nedir?

İşte benzer şekilde Linux çekirdeği üzerinde yapılan yani bir Linux dağıtımı
içerisinde yapılan sistem programlama faaliyetlerine Linux Sistem Programlama
diyoruz. Benzer şekilde Windows çekirdeği üzerinde yapılan sistem programlama
ise *Window Sistem Programlama* olarak adlandırılır.

Ubuntu, Arch, Fedora gibi Linux dağıtımları adı Linux olan bir çekirdekten
(kernel) ve bu çekirdeğin sunduğu hizmetleri kullanarak çalışan ve bir araya
gelmiş birçok uygulamadan oluşur. Eğer bizler de bu tarz işletim sistemleri
üzerinde (neredeyse) doğrudan çekirdek ile konuşarak çalışan programlar yazarsak
biz de *Linux Sistem Programlama* yapmış oluruz. Bir de *Linux Kernel
Programlama* vardır, bu ikisi farklıdır. Sistem programlamada kernel tipik
olarak bir kara kutu olarak düşünülür, içerisindeki yapı ile pek ilgilenmeyiz.
Sistem programlamada daha çok kernelin sunduğu hizmetlerden faydalanır. Elbette
bahsettiğimiz Linux kernelinin de kendisi bir yazılımdır (hem de çok büyük).
İşte kernelin kendisinin geliştirilmesine ya da kernel içerisinde çalışan aygıt
sürücülerinin (device driver) oluşturulmasına *(Linux) Kernel Programlama* adı
verilir.

Linux üzerinde yazdığımız tüm programlar otomatik olarak *sistem programı*
olmamaktadır. Örneğin Python gibi yüksek bir seviyeli dilde, kernel ile doğrudan
konuşmayarak yazdığımız bir program Linux üzerinde çalışsa bile bu programlama
faaliyeti bir sistem programlama olmamaktadır. Çünkü bu durumda, Python
yorumlayıcısı ve kütüphanelerinden dolayı kernel ile aramızda *kalın* bir
soyutlaştırma katmanı vardır. Fakat doğrudan
[POSIX](https://en.wikipedia.org/wiki/POSIX) kütüphanelerini kullanarak
(ilerleyen kısımlarda değineceğim) yazdığımız bir C programı bir sistem programı
olacaktır. Bu farkı henüz tam anlamamış olabilirsiniz, ki çok normal. Biraz
elinizi kirlettikçe bu konuyu daha iyi anlayacaksınız.

*Aklıma yeni Sık Sorulan Sorular (SSS) bu kısmı güncelliyorum.*

## Bu Seri Hakkında

Web sitemde oluşturduğum bu serideki amacım Linux Sistem Programlama konusundaki
bilgimi aktarmaktadır, asla iyi bildiğimi söylemiyorum, hatalar olabilir. Fark
ettiğiniz hatalı kısımları benimle paylaşırsanız çok sevinirim. Seriyi her ne
kadar mantıksal bir sırada oluşturmaya çalışsam da amacım bir eğitim kaynağı
oluşturmak değil. **Ben bir eğitmen değilim.** Yazıların içeriklerini ve
derinliklerini *kafama göre* oluşturuyorum. Bazı yazılar yeni başlayanlar için
görece daha kapsamlı ya da basit olabilir. Herhangi bir eğitim amacı gütmeden,
*kafama göre* yazıyorum.

## Kaynaklar

Linux Sistem Programlama konusu ile ilgili faydalı olduğunu düşündüğüm ve bu seri
boyunca kullandığım kaynakları burada listeliyorum.

*Yeni kaynaklar buldukça bu kısmı güncelliyorum.*

### 🌐 İçerik

- Kaan Aslan tarafından hazırlanmış
  [notlar.](https://github.com/CSD-1993/KursNotlari) Kendisinden aldığım
  *Unix/Linux Sistem Programlama* dersindeki notlarımı da sıklıkla kullanıyorum.
  🌟
- Murat Demirten tarafından hazırlanmış [Linux Sistem
  Programlama](https://demirten.gitbooks.io/linux-sistem-programlama/content/)
  isimli açık online kitap.

### 📚 man Sayfaları

- <https://www.mankier.com/> 🌟
- <https://man7.org/linux/man-pages/index.html>
- <https://man.cx/>
- <https://manpages.debian.org/>
- <https://man.archlinux.org/>
- <https://tldr.inbrowser.app/>
- <https://linux.die.net/man/>

### 📖 Kitaplar

- [The Linux Programming Interface.](https://man7.org/tlpi/) Michael Kerrisk.
  ISBN 978-1-59327-220-3
- [Advanced Programming in the UNIX Environment, 3rd
  Edition.](https://a.co/d/64BHrrD) W. Stevens ve Stephen Rago ISBN
  978-0321637734
- [The Linux Command Line.](http://linuxcommand.org/tlcl.php) William Shotts

### 📝 Standartlar

- [POSIX ve SUS](https://pubs.opengroup.org/onlinepubs/9699919799.2018edition/)

### 👓 Bakmaya Değer

- <https://blog.packagecloud.io/the-definitive-guide-to-linux-system-calls/>
- <https://stackoverflow.com/a/2538212>
- [Introduction to Linux
  (LFS101x)](https://training.linuxfoundation.org/training/introduction-to-linux/)

### 🔤 Tercüme ve İçerik

- <https://terimler.org/>
- Kaan Aslan, Necati Ergin, Murat Demirten, Prof. Dr. Oğuz Ergin kaynakları

## Bu Yazıda Kullanılan Kaynaklar

- [Systems programming (Wikipedia)](https://en.wikipedia.org/wiki/Systems_programming)

## Yazılar

Serideki yazıları sıra ile okumanızı tavsiye ederim.

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
{% assign linuxsys_posts = site.posts | where_exp:"post", "post.tags contains 'linsys'" | sort: 'date' %}
<ul>
{% for post in linuxsys_posts %}
  <li>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </li>
{% endfor %}
</ul>
<!-- markdownlint-restore -->
