---
# License: CC-BY-SA-4.0.
title: "Why do we have programming languages in the first place?"
excerpt: "There are thousands of computer programming languages. But why? Why do we keep inventing them? Why do we compile C programs?"
image: /assets/img/24/9.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 9
published: true
tags:
  - en
---

In this post, I will discuss the presence of programming languages in general.
Initially, I had considered writing an article on the steps of C compilation.
However, before going into that specific topic, I decided to provide an overview
of computers and programming languages as a whole.

## Why do we have computers?

Computers are expensive and require extensive engineering effort to develop. As
individuals, we invest hundreds of dollars each year in our personal computers,
including laptops, gaming consoles, mobile phones, desktops, and more. But why?
They must serve a purpose, correct? Indeed. Actually, each of these computers
addresses a specific problem we encounter. Computers can perform complex
mathematical computations, facilitate aircraft landings, entertain us, enable
over-the-air communication, and even contribute to the discovery of planets in
space! But how do they accomplish these tasks? **What is the magic behind their
functionality?**

---

![ENIAC](/assets/img/24/9-eniac.jpg){:.centered .lazyload}

{:.text-align-center}
[ENIAC](https://en.wikipedia.org/wiki/ENIAC), designed in 1945 to solve
military-related problems, stands as one of the earliest computers (The whole
thing in the room is a single computer. Power consumption was higher than 150
kW). With a cost exceeding 6 million US Dollars (adjusted for inflation), it was
capable of performing only 5000 operations per second—a figure that may seem
modest compared to today's standards but still exceeded human capacity at the
time.
[Photo](https://commons.wikimedia.org/wiki/File:Classic_shot_of_the_ENIAC.jpg)

---

The magic lies in the ability to **leverage information** to accomplish these
tasks. Computers possess **memory** to **store** information and fast
**communication** links to facilitate the exchange of data. Ultimately, the crux
of computer functionality revolves around the generation and processing of
information.

> Computers are incredible inventions created by smart people, but there's no
> actual magic involved. They work because they've been carefully designed and
> engineered. If you want to experience something truly magical, consider
> exploring the wonders of nature through the study of natural sciences. 🪄

Nearly all problems solved by computers boil down to mathematical problems.
Computers excel with numbers, capable of executing algorithms on data orders of
magnitude faster than a human could. **But how do they achieve this?**

## Processors

Processors serve as the heart of computers. A processor is an electronic
hardware component capable of manipulating numbers at an incredibly high speed.
While processors themselves can't store data, they "process" (hence their name)
the stored data, such as in RAM, and generate new data. They can achieve this at
rates of billions of operations per second. Examples of processors include the
**CPU** (Central **Process**ing Unit), **GPU** (Graphics **Process**ing Unit),
and **TPU** (Tensor **Process**ing Unit).

**CPU**s, or **Central Processing Units**, are general-purpose processors found in
nearly all computers and many electronic devices. They are designed to handle a
wide range of tasks, such as text editing, web surfing, and number crunching,
typical of personal computers. Unlike specialized processors optimized for
specific tasks, CPUs are not tailored to excel in any single function but rather
are engineered to efficiently handle a variety of tasks.

![6502](/assets/img/24/9-6502.jpg){:.centered .lazyload}

{:.text-align-center}
The [MOS Technology 6502](https://en.wikipedia.org/wiki/MOS_Technology_6502) is
a highly renowned microprocessor introduced in 1975, widely utilized in numerous
microcomputers and video game consoles during the 1980s era. Capable of
executing 1-2 million operations per second, it represented a significant leap
in computing power compared to the 5000 operations per second capability of the
ENIAC, which was designed in 1945. Despite its enhanced performance, the price
of the 6502 remains relatively affordable, around $150 today when adjusted for
inflation (originally $25 in 1975).
[Photo](https://en.wikipedia.org/wiki/File:MOS_6502AD_4585_top.jpg)

---

**GPU**s, or **Graphics Processing Units**, differ from CPUs. While they are also
processors, their internal architecture is specifically optimized to efficiently
handle calculations required for graphical tasks. GPUs excel in processing
graphical data by leveraging parallel computing, utilizing thousands of multiple
processors designed to execute tasks simultaneously. Because neural network
problems share a similar parallel nature to graphics tasks, GPUs are
increasingly being utilized not only for graphical applications but also for
solving AI problems. Nonetheless, they remain processors at their core.

![RTX 4090](/assets/img/24/9-rtx-4090.jpg){:.centered .lazyload}

{:.text-align-center}
The modern GPU card, Nvidia's RTX 4090, released in 2022 for approximately
$1600, boasts impressive capabilities. With its [GeForce 40 series
GPU](https://en.wikipedia.org/wiki/GeForce_40_series), it can perform 73,000
billion single-precision floating-point operations per second while operating
under 450W. [Photo](https://en.wikipedia.org/wiki/File:NVIDIA_RTX_4090.jpg)

---

**TPU**s, or **Tensor Processing Units**, are custom processors specifically
designed for neural network applications. Developed by Google,
[TPU](https://en.wikipedia.org/wiki/Tensor_Processing_Unit)s are engineered to
perform the mathematical operations necessary for neural network tasks more
efficiently than GPUs. Unlike GPUs, TPUs are tailored solely for optimizing the
performance of neural network computations.

![TPU](/assets/img/24/9-TPUv3.jpg){:.centered .lazyload}

{:.text-align-center}
Photo of TPUv3 processors. We can't see them directly because they are under
heatsinks. TPUv4 announced in 2021 is capable of doing 275,000 billion
operations per second while operating under 170W.
[Photo](https://en.wikipedia.org/wiki/File:Tensor_Processing_Unit_3.0.jpg)

---

**Microcontroller**s, MCUs, present in nearly all electronic devices, also
contain processors within them. In general, these processors are specifically
designed to handle tasks that are not computationally intensive. However,
certain microcontrollers are engineered to execute tasks with minimal power
consumption, enabling devices to operate for years a single battery.

![PIC](/assets/img/24/9-PIC18F8720.jpg){:.centered .lazyload}

{:.text-align-center}
A [PIC](https://en.wikipedia.org/wiki/PIC_microcontrollers) microcontroller from
[Microchip Technology](https://en.wikipedia.org/wiki/Microchip_Technology).
[Photo](https://commons.wikimedia.org/wiki/File:PIC18F8720.jpg)

---

As evident, there exist numerous types of processors, beyond the examples
provided, each tailored for specific purposes. Various companies are involved in
the design and manufacturing of these processors. For instance, Intel and AMD
are renowned for their CPUs, while Nvidia specializes in GPUs.

**However, regardless of the type or manufacturer, all these processors
fundamentally operate in a similar manner. The process of utilizing or
programming them has remained essentially the same for decades, spanning across
a wide range of processors.**

## Talking with Processors

Now that we've grasped the importance of the processor in a computer system,
whether it's a CPU, GPU, TPU, or any other variant, let's delve into its primary
functions. Broadly speaking, a processor performs two types of tasks:
**arithmetic operations**, which involve mathematical computations like
addition, multiplication, and division, and **logical operations**, which entail
making decisions based on conditions—for instance, determining if number `A` is
greater than `B` and taking appropriate actions accordingly. But how exactly do
we communicate with a processor to get our tasks done?

Let's imagine that I've purchased an [AMD Ryzen 7
8700G](https://www.amd.com/en/products/apu/amd-ryzen-7-8700g) CPU from a
computer store. This CPU, designed by AMD and released in early 2024, is capable
of performing billions of operations per second, which is quite impressive. Now,
let's say I simply want to add two numbers together and obtain the result. How
can I communicate this task to the CPU? How do I tell the CPU, "Hey, here are
two numbers. Please add them together and return the result to me?"

![AMD Ryzen 7 8700G](/assets/img/24/9-amd-ryzen-7-8700g.jpg){:.centered .lazyload}

{:.text-align-center}
AMD Ryzen 7 8700G. Photo by [Tom's
Hardware.](https://www.tomshardware.com/pc-components/cpus/amd-ryzen-7-8700g-cpu-review)

---

As we've observed, there is a wide array of processors available today, each
tailored to different applications with various optimizations such as power
consumption and speed. Over the past 80 years, these processors have undergone
dramatic changes in size, performance, and price. Comparing the computational
power of a modern basic cell phone to that of the [Apollo Guidance
Computer](https://en.wikipedia.org/wiki/Apollo_Guidance_Computer), for example,
would be practically meaningless. However, with all these historical
advancements and variations, one fundamental aspect remains nearly unchanged:
**the basic operational principle of a processor.**

Processors are essentially devices designed to execute tasks, functioning as an
*execution engine* of sorts. Regardless of their processing power, a processor
simply carries out the instructions it is given—no more, no less. We provide a
list of commands, or **instruction**s, to a processor, and it executes them one
by one. Each instruction tells the processor precisely what action to take. A
computer program essentially consists of an ordered set of instructions for the
processor to follow. These instructions are stored in memory, typically RAM, and
can be accessed by the processor. The processor then begins executing these
instructions sequentially, from start to finish. Below is an illustration of how
a program appears in memory:

```text
Instruction 001: Do this
Instruction 002: Do that
Instruction 003: If A < N, do this otherwise do that
...
Instruction 875: Do this
Instruction 876: End
```

As you may have noticed, for a processor to be capable of performing useful
tasks, it needs to support more than just one instruction. A processor that can
only add two numbers together without any additional functionality wouldn't be
very practical, would it? Therefore, processors are designed to support a wide
range of instructions, and the set of instructions supported by a processor is
called its **Instruction Set**.

If you're interested in this topic, you may have come across two terms: **RISC**
and **CISC**. In these terms, `IS` in the middle stands for **I**nstruction
**S**et. RISC stands for **R**educed **I**nstruction **S**et **C**omputer, while
CISC stands for **C**omplex **I**nstruction **S**et **C**omputer. Anyway, let's
proceed with our exploration: talking with processors.

---

Let's delve into instructions in more detail. As mentioned earlier, instructions
are stored in memory and are accessible by the processor. Computers operate
using numbers, [binary numbers](https://en.wikipedia.org/wiki/Binary_number)
most of the time, which consist of 0s and 1s. This applies to both memory and
processors. Each instruction communicates to the processor what action to take.
To efficiently store these commands in memory, each command is encoded with a
number. For instance, for a specific processor, reading a "1" from memory might
indicate an addition operation, "2" for subtraction, "3" for comparison, and so
on. In a moment, I'll provide a real-life example from a processor to illustrate
this further. Stay tuned!

### Example: PIC16F84

Let's examine a real-life example. To maintain simplicity and focus on the topic
without getting distracted by advanced features implemented by a processor, I've
chosen an old microcontroller from Microchip Technology: the
[PIC16F84](https://www.microchip.com/en-us/product/pic16f84). This
microcontroller holds a special significance for me because it was the first
microcontroller I programmed when I began experimenting with hobby electronics
in high school.

![PIC 16C84](/assets/img/24/9-PIC16C84.jpg){:.centered .lazyload}

{:.text-align-center}
[PIC16C84](https://en.wikipedia.org/wiki/PIC16x84) is an older version of
PIC16F84. It was introduced in 1993.
[Photo](https://commons.wikimedia.org/wiki/File:Two_Microchip_PIC16C84_chips.jpg)

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
