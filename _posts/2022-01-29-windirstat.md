---
title: "WinDirStat"
excerpt: "'Diskimde en çok hangi klasörler yer kaplıyor?' sorusuna cevap bulun!"
tags:
    - tr
locale: tr_TR
axseq: 1
published: true
image: /assets/img/22/1.png
#canonical_url: 'https://asynx.dev/windirstat'
---

- <https://windirstat.net/>
- Açık kaynak
- Windows

WinDirStat, açılımı ile **Windows Directory Statistics**, özellikle diskim dolmaya
yaklaştığı zaman kullandığım bir yazılım. Çünkü böyle durumlarda bir kurban
seçip onu silmem gerekiyor. Bir noktadan sonra hangi klasörün içinde gerekli
gereksiz ya da büyük küçük hangi dosyalar var insan unutuyor. Bu yazılım ile bu
tarz klasörleri hemen bulmak mümkün.

Yazılımı çok tarif edecek bir kullanımı yok aslında, kurup çalıştırınca
aşağıdaki gibi karşılama ekranında dilerseniz istediğiniz bir diski komple
taratabilir (uzun sürebilir) ya da seçtiğiniz bir klasörü analiz
ettirebilirsiniz.

![WinDirStat Karşılama Ekranı](/assets/img/22/1-windirstat.png)

Seçim yaptıktan sonra `OK` dediğimizde Analiz bitiyor ve dosya tiplerini, alt
klasörlerin ne kadar yer kapladığını görüyoruz. Bu noktadan sonra dilerseniz
`Clean Up` menüsünden ya da doğrudan Windows'un dosya yöneticisinden dosyaları
silebilirsiniz.

> ⚠️ Programın içinden ya da Windows dosya yöneticisinden `Del` tuşu ile silme
> yapılırsa dosyalar çöp kutusuna gideceği için yer açmaya çalıştığınız diskte
> muhtemelen durmaya devam edecekleri için aslında yer açmamış olacaksınız. Silme
> işlemlerinin `Shift + Del` tuşu ile yapılması bunu engelleyecektir.

## Linux

Linux'ta benzer bir arayüz sunan
[K4DirStat](https://github.com/jeromerobert/k4dirstat) yazılımını tercih
ediyorum.
