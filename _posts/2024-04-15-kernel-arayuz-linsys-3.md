---
# License: CC-BY-SA-4.0.
title: "Linux Kernel Arayüzü - Linux SYS - 3"
excerpt: "Linux kerneli ile nasıl konuşabiliriz?"
image: /assets/img/24/15.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 15
published: true
tags:
  - tr
  - linsys
---

[Bir önceki yazıda]({% post_url 2024-04-14-posix-sus-lsb-linsys-2 %}) POSIX, SUS
ve LSB gibi kavramlardan bahsetmiştim. Bunların çeşitli standartlaştırma
faliyeti olduğunu anladık. Peki ilk sorumuzua dönecek olursak: Kernel ile nasıl
konuşacağız?

Kernel ile konuşmanın yolunun sistem çağrıları olduğundan bahsetmiştim. Fakat
kernelin tanımladığı ABI üzerinden, CPU registerlarını kullanarak sistem
çağırısı yapmak hem taşınabilir değil (x86, ARM, RISC-V, vs gibi) hem de pratik
değil. **Linux üzerinde pratikte kullanabileceğimiz en düşük seviyeli çağrı
mekanizması Linux dağıtımlarında bulunan C API arayüzüdür.** Nasıl standart C
fonksiyonlarını çağrıyorsak burada da başka fonksiyonlar çağrıyoruz. Bu
fonksiyonların bir kısmı gidip kernel ile konuşuyor, bir kısmı kernele gitmeden
bizim işlerimizi hallediyor. **Peki bu fonksiyonlar nerede kodlanmış durumda?**
Linux dağıtımlarda tipik olarak bu fonksiyonlar standart C kütüphanesi ile
beraber C kütüphanesine yer alıyor. En çok bilineni ve kullananı GNU C
kütüphanesi, yani **glibc**.  Bunun dışında `uClibc`, `Newlib`, ve `musl` gibi
başka C kütüphaneleri de mevcut [^1f].

Kernelin kendisi C kütüphanelerini bilmez. Fakat kernel geliştiricileri ile
kütüphane geliştiricileri el ele vererek, kendi aralarında uyumlu olacak şekilde
bizlere bir **C API** sunuyorlar. Bu API, birçok noktada POSIX (ya da SUS) ile
belirtilen standart arayüzle uyumlu. Ama Linux kerneline özel olarak eklenmiş
çeşitli fonksiyonlar mevcut. Ayrıca POSIX standartlarında belirtilen tüm
fonksiyonlar (veya fonksiyonların çeşitli argümanları) Linux üzerinde
desteklenmeyebiliyor [^1f].

İşte bu şekilde Linux üzerinde, belirtilen C API kullanarak yazılım yazmayı
düşünenler için bı API'yı anlatan dokümanlar oluşturan **man-pages** projesi
vardır. Bu API ile POSIX standartlarının önemli ölçüde kesiştiği noktalar
vardır. Burada Linux dokümanları ile POSIX dokümanları birbirine benzer. Eğer
sizin de amacınız benim gibi *sadece Linux üzerinde* çalışması yeterli olacak
programlar yazmak ise, yani POSIX uyumluluğuna takıp programınızın macOS gibi
diğer UNIX türevi işletim sistemlerinde çalışması sizler için önemli değilse man
sayfalarına bakmanız yeterli olacaktır. Elbette bir kenarda POSIX dokümanlarını
tutmanın zararı da yok. Ama Linux üzerinde program yazacaksak yani Linux sistem
programlama yapacaksak man sayfalarından devam edebiliriz.

Bu sayfada, bu dokümanlara nasıl ulaşacağımıza ve nasıl yolumuzu
bulacağımıza (maddi açıdan değil, kaybolmamak anlamında) daha detaylı bakacağız.

> 💡 İnternette araştırma yaptığınıza *Linux API* isimli dokümanları bulabilirsiniz.
> Bunların önemli bir kısmı aslında *Linux Kernel API* anlatıyor oluyor, yani
> kernel içerisinde kod yazan (aygıt sürücüsü gibi) kernel geliştiricilerinin
> kernel içerisinde kullanabileceği çeşitli API'lar anlatılıyor. Bunlar *Linux
> Sistem Programlama* amacıyla kullanılabilecek fonksiyonlar değillerdir. Okurken
> dikkatli olmakta fayda var. Korkmayın başınıza pek bir şey gelmez, en kötü
> derleyemezsiniz ya da kodunuz çalışmaz ama vakit kaybetmeyin.

## Sıradaki Yazı

{% include ax_single.html reccmode="single" reccyear="24" reccaxseq="16"%}

## Kaynaklar

- [Kaynaklar]({% post_url 2024-04-12-linux-sistem-programlama-nedir-linsys-0 %})
- [man-pages](https://www.kernel.org/doc/man-pages/)

[^1f]: <https://en.wikipedia.org/wiki/Linux_kernel_interfaces>
