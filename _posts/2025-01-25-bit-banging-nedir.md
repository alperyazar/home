---
# License: CC-BY-SA-4.0.
title: "Bit Banging: Donanımı Yazılım ile Taklit Etme"
excerpt: "Bit banging, günümüzde artık gömülü yazılımcının son kalesi olan bir teknik. Yine de bir gün işiniz düşebilir…"
image: /assets/img/25/2.png
#imageyt: mIzPfenZWvo
toc: true
axseq: 2
published: true
tags:
  - tr
---

Bu yazımda sizlere gömülü yazılımda artık günümüzde eskiye kıyasla çok sık
kullanılmayan ama günü geldiğinde de işinize çokça yarayabilecek bir teknikten
bahsetmek istiyorum: **bit banging**

Bit banging, temelde bir donanımı o donanım olmadan yazılım ile taklit etmeye
yarıyor. Buradan yola çıkarak *Mikrodenetleyicilerde ve işlemcilerde neden
birçok donanım bileşeni bulunuyor?* ve *Neden bit banging bize her zaman çözüm
olmuyor?* gibi bazı sorulara cevap arayacağız. Yazının akışı şu şekilde
olacaktır:

- xxx
- xxx
- xxxx

Keyifli okumalar…

## UART (Seri Kanal) Üzerinden Veri Gönderme

Gelin bir örnekle başlayalım. Elimizde bir mikrodenetleyicimiz olsun (yazının
ilerleyen kısımlarında kısaca *MCU* diyeceğim) ve bu MCU'dan seri kanal yani
UART üzerinden bir mesaj gönderiyor olalım. Bulabileceğimiz neredeyse tüm
MCU'ların en az bir dahili UART modülü olacaktır. Bu UART modülünün 1-byte yani
8-bit genişliğinde `TXREG` isimli bir yazmacı yani register'ı olsun. Buraya
yazılan 1-byte'lık veriler UART modülü tarafından RS-232 protokolüne uygun bir
şekilde bit bit gönderiliyor olsun. Son olarak da bu modülün gönderim işleminin
bittiğini gösteren bir kesme yani interrupt çıkışı olsun ve bu sayede işlemcimize
gönderimin bittiğini haber verebilirsin.

## Kaynaklar

- [Kapak
  fotoğrafı](https://www.wallpaperbetter.com/en/hd-wallpaper-todzv/download/1280x800)
