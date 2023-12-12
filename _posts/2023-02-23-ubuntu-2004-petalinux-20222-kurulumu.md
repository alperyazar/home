---
title: "Ubuntu 20.04 üzerine PetaLinux 2022.2 kurulumu"
excerpt: "Bir iki nokta dışında problemsiz 👍"
locale: tr_TR
tags: tr
published: true
axseq: 1
image: /assets/img/23/1.jpg
canonical_url: 'https://asynx.dev/ubuntu-2004-uzerine-petalinux-20222-kurulumu'
---

> Kapak fotoğrafı:
> [Gabriel Heinzer](https://unsplash.com/@6heinz3r?utm_source=unsplash&utm_medium=referral&utm_content=creditCopyText)

Xilinx PetaLinux 2022.2'yi Ubuntu 20.04 üzerine kurarken aldığım notlardır. Adım
adım kurulum aşamaları için her zaman olduğu gibi [resmi
dokümanı](https://docs.xilinx.com/r/en-US/ug1144-petalinux-tools-reference-guide/Installing-the-PetaLinux-Tool)
takip etmenizi öneririm. Kurulumu oldukça "taze" bir Ubuntu 20.04 üzerine
yaptım, o yüzden doğruluğunun iyi olduğunu düşünüyorum ama bir sorun ile
karşılaşırsanız yorumlarda belirtirseniz sevinirim.

Kuruluma geçmeden önce **apt** ile çeşitli paketlerin kurulması gerekiyor.
Eskiden PetaLinux kurulumlarında kurulacaklar paketleri liste olarak verildi,
bir süredir Xilinx `plnx-env-setup.sh` isminde bir BASH script'i veriyor bunları
kurmak için (hem deb tabanlı Ubuntu gibi dağıtımlar için hem de rpm tabanlı
CentOS gibi dağıtımlarda kullanılabilir). Bunu
[şuradan](https://support.xilinx.com/s/article/73296?language=en_US)
indirebilirsiniz. Benim indirdiğim zaman ilgili sayfanın güncelleme tarihi 23
Eylül 2021'di. Script'i güncelliyorlar mı bilmiyorum, açınca içerisinde bir
yorum satırı bulamadım. Referans olması açısından kullandığım script dosyasının
MD5 değeri: `1C4423D90E29EE97B2EC36F3AED45FDD`. Önce bunu tariflendiği gibi
**sudo** ile çalıştırıyoruz ve PetaLinux'un çalışması için gerekli paketleri
kuruyor. Trenz'in [kendi
wikisinde](https://wiki.trenz-electronic.de/display/PD/PetaLinux+KICKstart#PetaLinuxKICKstart-PetaLinuxInstallation)
bu script ile yapılan paket kurulumunun yeterli olmadığı bundan sonra apt ile
tekrar başka paketlerin kurulması gerektiği söylense de bende script yeterli
oldu.

## Desteklenmeyen işletim sistemi?

Kurulumdan sonra kullanım için terminalde `settings.sh` source edildiği zaman

```text
...
WARNING: This is not a supported OS
...
```

şeklinde bir uyarı çıkıyor. Dokümanında Ubuntu 20.04 sürümünün 20.04.\[1-4\]
versiyonları destekleniyor olarak belirtilmiş. Benim denememde tam sürüm 20.04.5
idi. Sondaki .5'e takılıyor sanırım ama eski PetaLinux sürümlerinin böyle *ufak*
şeylere takıldığını hatırlamıyorum. Sanmıyorum ki .4'te çalışan bir yazılım
.5'te çalışmamaya başlasın, o yüzden şimdilik ihmal ettim bunu.

## petalinux-config'te patlıyoruz

Bir örnek proje oluşturup `petalinux-config` dediğim zaman aşağıdaki hatayı
aldım:

```text
...
error loading hsi package: couldn't load file "libxv_commontasks.so": libtinfo.so.5: cannot open shared object file: No such file or directory
...
```

Bunun çözümü için bir paket daha kuruyoruz:

```shell
sudo apt-get install libtinfo5
```

Bu noktadan sonra bir problem kalmadı.

## Özet

- Xilinx'in verdiği `plnx-env-setup.sh` isimli script gerekli deb paketlerini
  apt ile kurmak için yeterli. Kurulum için değil de kullanım sırasındaki
  hatalardan kaçmak için `libtinfo5` kurmam gerekti ayrıca.
- Verdiği desteklenmeyen geçersiz işletim sistemi uyarısının anlamlı olmadığını
  düşünüyorum benim durumumda

Şimdilik durumlar iyi, bir değişiklik olursa yazıyı güncellerim. Ters bir şey
olursa siz de yorumlara yazabilirsiniz.
