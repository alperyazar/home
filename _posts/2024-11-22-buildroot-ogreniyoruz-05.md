---
# License: CC-BY-SA-4.0.
title: "Buildroot Öğreniyoruz - 5"
excerpt: "xxx"
#image: /assets/img/24/5.png
imageyt: dQw4w9WgXcQ
toc: true
axseq: 17
published: true
tags:
  - tr
---

> İçerik, bu sayfadaki yazıların üzerine anlatım yapılarak video olarak
> sunulmuştur. Her ne kadar yazı ile video içerik benzese de vaktiniz var ise
> videoyu izlemenizi tavsiye ederim, çünkü bazı noktalarda yazıda olmayan
> yorumlar yapıyorum.

{% include youtubePlayer.html id="dQw4w9WgXcQ" %}

Buildroot yolculuğumuza, *Buildroot Öğreniyoruz* serisinin 5 nolu bölümü ile devam
ediyoruz.

Bu bölümde:

- xxx
- xxx

yapacağız. Eğer izlemediyseniz serinin bir önceki bölümüne bakmanızı öneririm:

{% include ax_single.html reccmode="single" reccyear="24" reccaxseq="5" %}

## Tekrar Merhaba 👋

Önceki bölümü neredeyse **10 ay önce** hazırlamıştım. Bu süre zarfında Buildroot
ile ilgilenme imkanım olmadı. Son bölümde Virtualbox üzerinde bir geliştirme
ortamı kurmuştum. Bu süre zarfında o geliştirme ortamım dahi kalmadı, tekrar
sıfırdan oluşturdum. Bir yandan da iyi oldu, hatırlamış oldum…

Geliştirme ortamı olarak önceki bölümde anlattığım Virtualbox ve Ubuntu 22.04
temelli bir ortam kullanacağız. Buildroot ile çalışabilmek için gerekli olan
paketleri önceki bölümde tarif ettiğim gibi kurdum.

## 2024.02 ve Tekrar Derleme 🔨

Bu süre zarfında Buildroot'un yeni LTS (Long Term Support) sürümü çıkmış:
**2024.02.** Bootlin de eğitim notlarını yeni versiyona göre güncellemiş. [^1f]
Önceki bölümde `2022.02` kullanıyorduk. Şimdi ben de güncel eğitim notlarına
uymak adına `2024.02` kullanacağım. `git clone` işleminden sonra
`git checkout -b bootlin 2022.02` yerine
`git checkout -b bootlin 2024.02` yazacağız.

{% asciicast msg6hZrbaxPa8aZsOJEPfizuF %}

Bundan sonra önceki bölümde olduğu gibi yine **BeagleBone Black Wireless** için
bir konfigürasyon oluşturacağım. Bu süre zarfında kernel gibi bazı bileşenlerin
sürümü ilerlemiş ama temelde benzer bir akış var. Güncel dokümanları takip
ederek yapıyoruz: [^1f]

Önceki bölümde konuştuğumuz gibi yine `sudo apt install libssl-dev` ile paket
kurmamız gerekti. Bunu yaptıktan sonra `make` komutu ile derleme başarılı oluyor
ve `output/images` altında ilgili dosyalar oluşuyor.

{% asciicast LaCjkUVwCl9tQDjb9r5QoSuPA %}

```text
total 40M
drwxr-xr-x 2 ay ay 4,0K Kas 22 23:11 .
drwxrwxr-x 6 ay ay 4,0K Kas 22 23:11 ..
-rwxr-xr-x 1 ay ay  69K Kas 22 23:11 am335x-boneblack-wireless.dtb
-rw-r--r-- 1 ay ay 108K Kas 22 22:48 MLO
-rw-r--r-- 1 ay ay  31M Kas 22 23:11 rootfs.tar
-rw-r--r-- 1 ay ay 668K Kas 22 22:48 u-boot.bin
-rw-r--r-- 1 ay ay 1,5M Kas 22 22:48 u-boot.img
-rw-r--r-- 1 ay ay 6,8M Kas 22 23:11 zImage
```

**Şimdi aynı noktaya geldik, bende hala BeagleBone Black (Wireless) yok 😢**

## QEMU ❓

QEMU'nun [Arm System
emulator](https://www.qemu.org/docs/master/system/target-arm.html) aracını
kullanarak BBB (BeagleBone Black) için derlenmiş yazılımları x86-64
bilgisayarımda emule ederek çalıştırabilir miyim diye bir denemek istedim.
Internette yaptığım kısa bir araştırma sonucu QEMU ile BBB'nin çok kolay bir
şekilde *taklit* **edilemediğini** okudum. Buildroot ile QEMU'da çalışacak
imajlar üretmek istiyorsak bunun için zaten yapılmış konfigürasyonlar
[var.](https://github.com/buildroot/buildroot/blob/master/configs/qemu_aarch64_virt_defconfig)
Ama yine de belki kernel'i ayağa kaldırabilirim diye deneme yapmak istiyorum.
Bunun için Ubuntu host sistemime `sudo apt install qemu-system-arm` ile
`qemu-system-arm` kuruyorum. BBB üzerinde 32-bit bir ARM işlemci olduğunu
tekrar anımsayalım. Paket bağımlılıkları ile beraber yaklaşık 500 MB'lık bir
kurulum oluyor.

## Kaynaklar 📚

- [Qemu but for beginners, QEMU Starter](https://github.com/TunaCici/QEMU_Starter)
  Tuna Cici

[^1f]: <https://bootlin.com/doc/training/buildroot/buildroot-labs.pdf>
