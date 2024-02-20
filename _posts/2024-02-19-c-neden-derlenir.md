---
# License: CC-BY-SA-4.0.
title: "C derleyicileri neden var? Neden kodları derliyoruz?"
excerpt: "'C Günlükleri'nin bu üçüncü yazısında 'Neden C derleyicileri var? Niye böyle bir işlem yapıyoruz?' gibi soruları cevaplamaya çalışıyorum."
image: /assets/img/24/9.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 9
published: true
tags:
  - tr
---

'C Günlükleri' isimli blog serimin üçüncü yazısından merhaba! C'nin teknik
kısımlarına girmeden önce (Fonksiyon nedir? Pointer nedir? gibi...) derleyici
konusuna bir değinmek istiyorum. C ile yeni tanıştıysanız bir derleme işleminden
ve derleyicilerden bahsedildiğini duymuşsunuzdur. Peki her şeyden önce **"Bu işlem
neden var? Niye bir kodu derlememiz gerekiyor? Bir kodu çalıştırmanın tek yolu
derlemek midir?"** gibi sorulara değinmek istiyorum. **"Neden?" her zaman
"Nasıl?"dan önce gelmelidir.** diye düşündüğümden "Kod nasıl derlenir?"
sorusundan önce "Kod neden derlenir?" sorusuna bir bakalım.

Gelin konuyu biraz daha geniş alalım. **Bilgisayarlar neden var?** Niçin bir sürü
para harcayıp, bilgisayar sistemleri (buna gömülü sistemleri de dahil
edebilirsiniz) kuruyoruz veya alıyoruz? Günün sonunda bilgisayara yaptırmak
istediğimiz bir iş var, bizim bir sorunumuzu çözüyor. Bunu ise çeşitli
hesaplamalar yaparak (örneğin yapay zeka uygulamalarında matris işlemleri gibi)
bize sağlıyor. Bilgisayarın matematiksel ya da çeşitli mantıksal
(bu şundan büyükse şunu yap gibi) işlemleri yapan birimine ise **işlemci** diyoruz.
Yani özünde bilgisayarımızın içerisinde bulunan işlemciye bir iş yaptırmak
istiyoruz.

Günümüzde birçok işlemci modeli ve işlemci üreten/tasarlayan firma var:
Intel, AMD, Apple, Qualcomm, ARM, RISC-V gibi. Diyelim ki gittik bir işlemci
aldık ve o işlemciyi çalıştıracak bilgisayarımızı kurduk. **Peki bu işlemci ile
nasıl konuşacağız?** Diyelim ki hesaplattırmak istediğimiz bir denklem var. "Ey
işlemci! Şunu hesapla!" yı nasıl diyeceğiz? İşlemci ile bir şekilde anlaşmamız,
konuşmamız gerekiyor ki işimiz görülsün. İşte burada işlemcinin bize sunduğu
**komut seti** devreye giriyor.

İşlemcilerin iç yapıları, hızları, üretildikleri teknoloji (transistörlerin
boyutu gibi, nanometre konuları) yıllar içerisinde değişti. Yıldan yıla
işlemciler hızlanıyor, daha az güç tüketiyor ya da bazı hesaplamaları daha
verimli yapabiliyorlar. Ama belki onlarca yıldır değişmeyen şeylerden biri de
işlemcilerin kullanıcı açısından nasıl çalıştığıdır. Günümüzde gündelik
yaşantımızda kullandığımız hangi işlemciyi alırsanız alın sizden bir iş yapmak
için bir komut bekleyecektir. İşlemciler ne yazık ki zihnimizi okuyamıyor ve ne
yapmak istediğimizi anlayamıyorlar, onlara sıra ile komutlar vererek bizlerin iş
yaptırması gerekiyor. Yine sonuçları da bu komutlar sayesinde alıyoruz. İç
yapısı ne olursa olsun yazılımcı ya da kullanıcı açısından işlemci, sıra ile ona
verilen komutları yerine getiren bir makineden farklı bir şey değildir.

Bir işlemci,

```text
...
komut123
komut124
komut125
...
```

gibi arda arda verilen komutları yerine getirir. Bilgisayar programı dediğimiz
şey ise sıralanmış komutlardan farklı bir şey değildir. Elbette anlamlı bir iş
çıkabilmesi için komutların da belirli bir mantıksal sıra ile verilmesi gerekir.
Program yazmak demek de özünde bu komutları mantıksal bir sırada oluşturmak
demektir.

İşlemciler bizlere anlayacakları çeşitli komutlar sunarlar. Bu komutlar,
İngilizce'de **Instruction** olarak geçmektedir. Türkçe'de ise **komut** ya da
**buyruk** olarak adlandırılırlar. Tahmin edebileceğiniz üzere bir işlemci
birden fazla komutu anlayabilir, o komutlara göre farklı işler yapabilir. İşte
bir işlemcinin tüm komutlarının oluşturduğu kümeye o işlemcinin **buyruk
kümesi**, **komut seti** ya da İngilizce **Instruction Set (IS)** adı verilir.
Burada *Instruction Set* öbeğine dikkat çekmek istiyorum. Bu konu ile ilgili iseniz,
**RISC** (evet, RISC-V'teki RISC) veya **CISC** kısaltmalarını duymuş olabilirsiniz.
Bu kısaltmaları gelin açalım:

- RISC: **R**educed **Instruction Set** **C**omputer
- CISC: **C**omplex **Instruction Set** **C**omptuer

demektir. Bu terimlerin ne anlama geldiği şimdilik çok önemli değil ama kısaca
anlatayım. Bir işlemci için *RISC işlemci* deniyor ise o işlemcinin bize sunduğu
komut setindeki komutlar işlemciye daha kısa süren, daha basit ve temel işler
yaptırıyor demektir. *CISC işlemcilerin* sunduğu komut setindeki komutlar ise
işlemciye verildiği zaman bir komut, RISC işlemcilere kıyasla işlemciye daha
uzun süren, daha karmaşık işler yaptırıyor demektir. ARM, RISC-V gibi işlemciler
birer RISC işlemcidir. Öte yandan Intel/AMD tarafından üretilen x86 mimarili
işlemciler (çoğumuzun bilgisayarında olan) ise CISC işlemcidir. Ama günün sonunda
ne olursa olsun, bir komut o işlemcide ne kadar karmaşık ya da basit bir işlem
yaptırıyor olsun bizler işlemcilerle o komutlar üzerinden konuşuruz.

Diyelim ki işlemcimizin iki sayıyı toplayan `topla` isminde bir komutu var.
Bizim bu komut ile beraber hangi iki sayının toplanacağı ve sonucun nereye
yazılacağını iletmemiz gerekecektir. `topla` komutu ile beraber 3 farklı
parametre (**operand** olarak da adlandırılır) iletmemiz de gerekecektir,
toplanacak 2 sayı ve sonucun nereye (hangi register, yani yazmaç olacağı veya
hafızaya yazılacaksa hafıza adresi gibi) yazılacağı. Bu durumda `topla r4 r5 r6`
gibi bir komut veriyor olabiliriz. Burada örneğin `r5` ve `r6` yazmacındaki
değerleri topla ve `r4` e yaz diyoruz. Bunu ben tamamen uydurdum ama birazdan
gerçek işlemcilerin de komutlarının benzer olduğunu göreceğiz. İşte bu örnekte
olduğu gibi bir komutun parametrelerinin ne olacağı, işlemcinin hangi bellek
erişim yöntemlerini desteklediği, komutlarla desteklenen veri tipleri, yazmaçlar
(register) gibi işlemcinin bize sunduğu arayüzün tüm detaylarını barındıran
kavram ise **Instruction Set Architecture (ISA)** olarak geçmektedir.
**İşlemciyi tasarlayan ekip ile o işlemciyi kullanacak yazılımcıların arasındaki
kontrat ISA, olmaktadır.** Bir programcı olarak bir işlemci ile konuşacak onun
**ISA** dokümanlarını çalışmalıyız.

## Evrensel ISA?

"Ben bir işlemciye bir şeyler yaptıracaksam, o işlemcinin ISA'ında tanımlı
komutları kullanmalıyım değil mi?" Kesinlikle evet! Fakat burada kötü bir
haberim var. Birçok işlemci üreticisi ve modeli olduğundan bahsetmiştim. Ne
yazık ki tüm işlemcilerle konuşabileceğimiz evrensel bir ISA yok. 😢 Ama iyi
bir haberim de var, her işlemcinin anladığı komutlar yani desteklediği ISA
her bir işlemci için farklı değil. Burada işlemcileri gruplayabiliyoruz neyse ki.
İşlemcilerde **mimari** yani **architecture** kavramından bahsedebiliriz. Örneğin,
x86 mimarisinde bir işlemci, ARMv7-M mimarisi, ARMv8-A mimarisi gibi. İşte bunlar
kabaca bize o işlemcinin hangi ISA'yı desteklediğini söylüyor. Örneğin Intel olsun,
AMD olsun ya da başka bir marka işlemci olsun, x86 bir işlemci aldığınız zaman
o işlemci [burada](https://en.wikipedia.org/wiki/X86_instruction_listings) belirtilen
komutları destekleyecektir.

Ne yazık ki tüm işlemcilerin anlayacağı bir ISA elimizde yok fakat piyasadaki
her işlemci için bir ISA da yok, ortak gruplar mevcut.

## Bir Örnek, PIC16F84

Şimdi bu öğrendiklerimizi gerçek bir işlemci örneği ile pekiştirelim. Burada,
benim için özel bir mikrokontrolcü olan, Microchip firmasına ait PIC16F84 üzerinden
bir örnek vermek istiyorum. Bu mikrokontrolcü benim için özel çünkü ortaokul,
lise yıllarındayken amatör olarak elektronik ile uğraştığım zamanlarda öğrendiğim
ve çalıştığım ilk mikrodenetleyici buydu. Ek olarak kendisinin görece basit
bir işlemciye sahip olmasından dolayı konumuz için daha anlaşılır olacağını
düşündüm.

İlk olarak
[buradaki bağlantıdan](https://ww1.microchip.com/downloads/aemDocuments/documents/MCU08/ProductDocuments/DataSheets/30430D.pdf)
entegrenin datasheet'ine ulaşalım. Sayfa 55'te, `Instruction Set Summary` ismiyle
bir kısım başlıyor. Burada işlemcinin desteklediği ISA ile ilgili bilgiler verilmeye
başlanıyor. Hangi komutlar var? Komutların parametreleri (operand) nelerdir?
gibi sorularımızın cevabı bu bölümün altında yer alıyor.

Yazının başından beri bir işlemcinin desteklediği komutlar sanki yazıymış gibi
davrandık, `topla` diye bir örnek verdim mesela. Fakat işlemci komutları
yazılardan değil, 1 ve 0'lardan oluşuyor. Örnek verdiğim işlemcinin bir komutu
14-bit uzunluğunda 1 ve 0'lardan oluşuyor. Bu, datasheet'ten `FIGURE 9-1` olarak
gösterilmiş.

![PIC16F84 Komut Yapısı](/assets/img/24/9-figure-9-1.png){:.centered .lazyload}

{:.text-align-center}
PIC16F84'ün İşlemcisinin Komut Yapısı

Her bir komut 14 bit demiştim. Komut tipine göre her bitin anlamı değişişyor.
Örneğin `General` kategorisindeki komutların üst 6 biti `OPCODE`, düşük 8 biti
ise `literal` için ayrılmış.

Her bir komutun karşılık geldiği bir sayı oluyor, işte buna `OPCODE` deniyor.
Kalan bitlerin ne anlama geleceği ise komutun türüne bağlı. Yine aynı dokümanda,
tüm komutları ve 14-bitlik alana nasıl kodlandıklarını görmek mümkün.

![PIC16F84 Tüm Komutlar](/assets/img/24/9-table-9-2.png){:.centered .lazyload}

{:.text-align-center}
PIC16F84'ün İşlemcisinin Desteklediği Tüm Komutlar

Örneğin, `ANDLW` komutunu ele alalım:

![ANDLW](/assets/img/24/9-andlw.png){:.centered .lazyload}

{:.text-align-center}
ANDLW

PIC16F84 içerisinde tek bir genel amaçlı yazmaç (register) bulunuyor, ismi `W`
ve 8-bit genişliğinde. `ANDLW` komutu, `W` nin içerisindeki değeri sabit bir
8-bit genişliğinde değerle AND işlemine sokup, sonucu tekrar `W` ye yazmaya
yarıyor. Diyelim ki `0x12` sayısı ile AND'lemek isityoruz. Bu durumda işlemciye
vermek isteyeceğimiz komut `ANDLW 0x12` olacaktır. Peki bunu işlemciye bu şekilde
mi vereceğiz? Hayır. Dokümanda belirtildiği gibi `ANDLW` komutunun `OPCODE`
numarası `111001` ve arkasına AND'lemek istediğimiz sayıyı yani bizim durumda
`0x12` sayısını yazmak gerekiyor. `0x12` sayısını ikilik sistemde `00010010` olarak
yazabiliriz. Bu durumda `111001` ile `00010010` sayılarını yan yana koyarsak,
`11100100010010` ı elde ederiz. Dikkat ederseniz bu 14-bit genişliğinde bir sayı.

İşlemcinin aslında temelde sıra ile kod çalıştırdığını söylemiştik. PIC16F84 özelinde
her bir komut 14-bit genişliğinde. Bu komutlar işlemcinin erişebildiği bir kod
hafızasında yer alıyor. Bu hafızadan sırayla 14-bitlik komutları çekip, çalıştırıyor
gibi düşünebiliriz. İşte çalışma sırasında `11100100010010` ile karşılaşırsa
bunun karşılığı olarak istediğimiz AND işlemi yapılacaktır. Yani:

```text
<14-bit genişliğinde bir komut>
<14-bit genişliğinde bir komut>
...
11100100010010 -> ANDLW 0x12
...
<14-bit genişliğinde bir komut>
```

Yani günün sonunda her şey 1 ve 0'lardan oluşuyor. İşlemci ne kod bilir, ne C
bilir ne de Python!

## İşlemcileri Programlama

Eğer istersek, çalışacağımız işlemcinin dokümanlarına bakarak yaptırmak
istediğimiz işleri elle 1 ve 0'lar cinsinden kodlayıp, bunu işlemcinin kod
hafızasına yükleyebiliriz. Böylece yaptırmak istediğimiz işleri yaptırabiliriz.

Ama bu pek mantıklı durmuyor sanki? Çok saçma değil mi elle 1 ve 0'ları
kodlamak? Hataya çok açık durmuyor mu? Evet ama insanlar bunu zamanında yaptı!

### Altair 8800

![Altair 8800](/assets/img/24/9-altair.jpg){:.centered .lazyload}

{:.text-align-center}
[Altair 8800](https://commons.wikimedia.org/wiki/File:Altair_8800_Computer.jpg)

Yukarıda bilgisayar tarihinde önemli bir yere sahip olan **Altair 8800** isimli
"bilgisayar"ı görüyorsunuz. Altair 8800, MITS firması tarafından 1974 yılında
tasarlanan Intel 8080 temelli bir kişisel bilgisayardır. [^1f] Birçok kaynak
tarafından **ilk kişisel bilgisayar** olarak kabul edilir. Micrsoft ve Apple
firmalarının tarihininde önemli bir yere sahiptir, konumuz bu olmadığı için
atlıyorum.

Peki bu "bilgisayar"da bir şey dikkatinizi çekti mi? Bu bilgisayarın ne ekranı
ne de bir klavyesi var. Ön panelinde sadece anahtarlar ve lambalar yer alıyor.
Peki bu bilgisayarı nasıl programlıyorsunuz? İşte tam da yukarıda örneğini
yaptığımız gibi: **ISA'ya yani komut setine bakarak, `OPCODE` değerlerine
dokümanlara bakarak ulaşarak sırayla tüm komutları anahtarları 0/1 konumuna
getirerek bilgisayara giriyorsunuz.** Daha sonra bilgisayar bu komutları
çalıştırıyor siz de lambaların sönük/yanık yani 0/1 olmasına göre sonuçları
alıyorsunuz. Bu durumda derleyici de sizsiniz, debugger da sizsiniz, işlemci
ile sizin aranızda hiçbir şey yok.

İlginizi çektiyse şuradan devam edin:

{% include youtubePlayer.html id="cwEmnfy2BhI" %}

### Assembly (Sembolik Makine Dili)

İşlemcinin desteklediği 0/1'lerden oluşan komutları elle, işlemci dokümanına
bakarak oluşturmanın bir üst seviyesi **Assembly** yani Türkçe karşılığı ile
**Sembolik Makine Dili** kullanmaktadır. **Assembler** adını verdiğimiz
programlar, o işlemci için sembolik makine dilinde yazılmış programları makine
diline yani 0/1'lerden oluşan komutlara dönüştürür. Assembly dilinde yer alan
komutlar genelde **mnemonic** olarak adlandırılır, yani `OPCODE` lara verdiğimiz
takma isimler gibi düşünebilirsiniz.

> 🤔 Trivia: İlk assembler programın 1940'lı yıllarda tasarlanan EDSAC isimli
> İngiliz yapımı bir bilgisayar için oluşturulduğu belirtilmektedir. [^2f]

Assembler yazılımların işi görece basittir. Aslında temelde bizim için ilgili
işlemcinin dokümanlarına bakıp, 0/1'lerden oluşan komutları kendisi bizim
yerimize çevirir. Bunun yanında, `JUMP`, `BRANCH` gibi komutlar için verdiğimiz
*etiketler* çerçevesinde offset hesaplama, basit isim değişiklikleri gibi işler
de yaparlar yani bizler için kod yazmayı biraz daha kolaylaştırabilirler ama
özünde datasheet'ten komutların binary karşılıklarını oluşturma işini hallederler.

PIC16F84 ile verdiğim örnekte `ANDLW 0x12` nin karşılığının `11100100010010`
olduğunu belirtmiştim. Assembly dilinde kod yazdığımızda kodda bulunan `ANDLW
0x12`, assembler tarafından `11100100010010` şeklinde işlemciye verilmeye hazır
bir binary formata çevrilir.

Size örnek olması açısından bu sefer de yine Microchip firmasına ait PIC16F628A
için hazırlanmış bir assembly programdan bir kısım göstereyim

```asm
SAYAC1 EQU H'20'
SAYAC2 EQU H'21'
  CLRF    PORTB ; PORTB'yi sıfırlar
  BANKSEL TRISB
  CLRF    TRISB
  BANKSEL PORTB
TEKRAR
  MOVLW h'00'
  MOVWF PORTB
  CALL  GECIKME
  MOVLW h'FF'
  MOVWF PORTB
  CALL  GECIKME
  GOTO  TEKRAR
GECIKME
  MOVLW h'FF'
  MOVWF SAYAC1
DONGU1
  MOVLW h'FF'
  MOVWF SAYAC2
DONGU2
  DECFSZ SAYAC2, F
  GOTO   DONGU2
  DECFSZ SAYAC1, F
  GOTO   DONGU1
  RETURN
  END
```

> Yukarıdaki örneği bana doğrudan lise yıllarımı çağrıştıran, Orhan Altınbaşak
> tarafından yazılmış [Mikrodenetleyiciler ve PIC
> Programlama](https://www.kitapyurdu.com/kitap/mikrodenetleyiciler-ve-pic-programlama-pic16f628a/74980.html)
> kitabından aldım. Lise yıllarımda PIC programlamaya merak salmıştım ve bu
> kitapla tanışmıştım. Bu kitap Assembly dilinde kod yazmayı öğretiyor. Çok
> güzel hazırlanmış olduğunu düşünüyorum, bana katkısı büyüktür.

Assembly kodlarında gördüğünüz her bir satır genelde bir makine komutuna denk
gelir. Ama Assembly dilleri kod yazımını kolaylaştırmak için çeşitli özellikleri
destekleyebilir. Örneğin yukarıdaki örnekte en baştaki iki satırda yer alan
`EQU` ile oluşturulan deyimler, C dilindeki `#define` önişlemci komutuna
benzemektedir. Assembler, kodu derlerken `SAYAC1` ve `SAYAC2` kelimelerini
`0x20` ve `0x21` sayıları ile değiştirir. Benzer şekilde `GOTO DONGU2` yerine,
`DONGU2` etiketi ile belirtilen komutun adresi ne ise ona uygun bir adres
yazılır, atıyorum `GOTO -2` yani 2 komut geriye git gibi. Fakat satırların çoğu
işlemcinin desteklediği gerçek komutlardan oluşur, `MOVLW`, `MOVWF`, `DECFSZ`,
`GOTO` gibi... Bu kelimeler **mnemonic** olarak geçmektedir.

Assembly dilinde bu şekilde kod yazımını kolaylaştıran özellikler vardır. En
nihayetinde bir metin dosyasına bir şeyler yazıp buradan bir bilgisayar programı
yani assembler aracılığı ile otomatik bir şekilde 0/1'leri üretmek, anahtar ve
lambalar ile bilgisayar işlemcisi ile konuşmaktan çok daha iyi.

**Fakat hala işlemciden yeteri kadar soyutlanamadık.** Neden? Çünkü yukarıdaki
kodu sadece Microchip'in PIC16F628A mikrokontrolcüsü için ürettiği assembler
yazılımı anlayacaktır. Örneğin bu programı x86 mimarisindeki bir işlemciye
taşımamız (buna genelde, **port**, **porting**, **port etme** denir) gerekirse
x86'nın komut setine ve x86 için tasarlanmış assembler'a uygun şekilde (örneğin
o assembler'da `EQU` gibi bir destek olmayabilir ya da başka bir isimde
olabilir) taşımamız gerekirdi. Yani hala bir program yazarken onun hangi
işlemcide çalışacağını düşünmemiz gerekiyor. Ayrıca bir işlemci için yazılmış
bir assembly programını başka bir işlemciye taşıyamıyoruz, baştan yazmamız
gerekiyor.

### Programlama Dilleri ve Soyutlama

## Kaynaklar

- [The Computer That Changed Everything (Altair 8800) -
  Computerphile](https://www.youtube.com/watch?v=cwEmnfy2BhI)

[^1f]: [Altair 8080 - Wikipedia](https://en.wikipedia.org/wiki/Altair_8800)
[^2f]: <https://en.wikipedia.org/wiki/EDSAC>
