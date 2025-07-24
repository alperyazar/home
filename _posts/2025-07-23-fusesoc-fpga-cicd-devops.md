---
# License: CC-BY-SA-4.0.
title: "FuseSoC Bahane, FPGA Projelerinde CI/CD Şahane!"
excerpt: "xxx"
#image: /assets/img/23/1.png
imageyt: _-tSBsm21Bs
toc: true
axseq: 7
published: true
tags:
  - tr
---

Bu yazımda FuseSoC anlatma *bahanesi* ile temelde bir FPGA projesi geliştirirken
o projenin doğru bir şekilde versiyon kontrolünün yapılmasının neden önemli
olduğuna, bunun nasıl yapılabileceğine ve otomatik derleme, CI/CD ve DevOps
pratiklerine biraz değineceğim. Hadi başlayalım!

## FuseSoC nedir?

FuseSoC, açık kaynak, ücretsiz, Python dilinde geliştirilmiş, Windows ve Linux
üzerinde çalıştırılabilen **FPGA projeleri** için geliştirilmiş

- 1️ **paket yöneticisi** ve
- 2️ **build system (derleme,sentezleme sistemi)** dir.

Projenin ana geliştiricisi ve yürütücüsü [Olof
Kindgren](https://www.linkedin.com/in/olofkindgren) olup, projenin geçmişi 2012
yılına kadar gitmekte ve kaynak kodu [GitHub
üzerinde](https://github.com/olofk/fusesoc) bulunmaktadır. [^1f]

[^1f]: <https://github.com/olofk/fusesoc/graphs/code-frequency>
