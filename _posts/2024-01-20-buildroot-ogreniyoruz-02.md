---
# License: CC-BY-SA-4.0.
title: "Gömülü (Embedded) Linux nedir? Buildroot ve Yocto ne işe yarar? Buildroot Öğreniyoruz - 2"
excerpt: "Bu videoda, temel olarak Gömülü Linux kavramını irdeleyip, Buildroot ve Yocto gibi araçların hangi problemimizi çözdüğünü, ne işe yaradığını kavrayacağız."
#image: /assets/img/24/2.jpg
imageyt: Nv5_U1VWXlk
toc: true
axseq: 2
published: true
tags:
  - tr
---

> İçerik, video olarak sunulmuştur. Bu yazıda (varsa) düzeltmeler ve videoda
> geçen bağlantılar veya videoya ek notlar sunulmuştur.

{% include youtubePlayer.html id="Nv5_U1VWXlk" %}

Bu video
[serinin](https://www.youtube.com/playlist?list=PLr5LL6z9GIeE2auxES8u_MycPvl6AlCZw)
ikinci videosu. Burada "gömülü Linux" gibi çok önemli kavramlara değiniyoruz.

## Önceki Bölüm

{% include ax_single.html reccmode="single" reccyear="24" reccaxseq="1" %}

## Videoda Geçen Bağlantılar

- [Protection Ring (Wikipedia)](https://en.wikipedia.org/wiki/Protection_ring)
- [Revolution OS (IMDb)](https://www.imdb.com/title/tt0308808/)
- [Linux Kernel](https://www.kernel.org/)
- [GNU](https://www.gnu.org)
- [It should be i.e. "GNU/systemd/linux", discuss?
  (Reddit)](https://www.reddit.com/r/linuxmasterrace/comments/36jcfa/it_should_be_ie_gnusystemdlinux_discuss)
- Necati Ergin Bey'den aldığım C kursunu değerlendirdiğim ve neden Embedded C
  yani Gömülü C diye ayrı bir C dili olmadığından da bahsettiğim yazım:
  [](/blog/23/220-saatlik-c-kursu-alinir-mi.md)
- [BIOS (Wikipedia)](https://en.wikipedia.org/wiki/BIOS)
- [Devicetree (Wikipedia)](https://en.wikipedia.org/wiki/Devicetree)
- <https://distrowatch.com/>
- [systemd](https://systemd.io/),
  [SysVinit](https://wiki.archlinux.org/title/SysVinit),
  [BusyBox](https://en.wikipedia.org/wiki/BusyBox)
- [Circular dependency (Wikipedia)](https://en.wikipedia.org/wiki/Circular_dependency)
- [Linux From Scratch!](https://www.linuxfromscratch.org/)
- [Cross Compiler (Wikipedia)](https://en.wikipedia.org/wiki/Cross_compiler)
- [Patch (Wikipedia)](https://en.wikipedia.org/wiki/Patch_(Unix))

## Notlar

- Hatırlatma: `RootFS` kavramındaki `root` kelimesi ile `root` kullanıcısının
  bir bağlantısı yoktur. Tipik olarak en tepeden, kök dizinden yani
  *root* noktasından yani, `/` noktasından *mount* edilen dosya sistemine
  **Root File System, RootFS** denir.
- Videoda kütüphaneler için de "uygulama" diyorum. Burada kastettiğim şey aslında
  Firefox gibi uygulamalar gibi kütüphanelerin de birer **userspace** bileşeni
  olması. Videoda uygulama + kütüphanelerden "uygulama" olarak bahsediyorum.
  Elbette kütüphaneler, bizlerin bildiği klasik uygulamalar gibi değil. Yani
  biz doğrudan kütüphaneler ile etkileşime geçmiyoruz ya da kütüphaneler tek
  başlarına bir şey yapmıyorlar. Sağladıkları şey, uygulamaların bazı şeyleri
  daha kolay ve taşınabilir şekilde yapmasını sağlamak. `glibc` gibi bir C
  kütüphanesi ile BASH gibi bir uygulama işletim sisteminin **userspace**
  kısmında çalışıyor. Bu videodaki bağlamda hepsinden uygulama olarak bahsetmek
  o yüzden sınıflandırma açısından da yanlış değil.

## Sonraki Bölüm

{% include ax_single.html reccmode="single" reccyear="24" reccaxseq="4" %}
