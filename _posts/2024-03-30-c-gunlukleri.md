---
# License: CC-BY-SA-4.0.
title: "Tanıtım - C Günlükleri 0"
excerpt: "C programlama dili hakkındaki yazı dizimin tanıtımı"
image: /assets/img/24/10.jpg
#imageyt: sO_Sdf09DiY
toc: true
axseq: 10
published: true
tags:
  - tr
---

Bir elektronik mühendisi olarak gömülü sistemler dahil olmak üzere çeşitli
alanlarda çalışıyorum. C dili de çalıştığım projelerde sık kullandığım
programlama dillerinden biri. **C Günlükleri** isimli bu seride C ile ilgili
yazılarımı toplamaya karar verdim.

Bu seride temel kavramlardan başlayıp ilerlemeyi düşünüyorum. Vurgulamak isterim
ki **ben bir C uzmanı değilim.** Ayrıca bütün gün C ile de uğraşmıyorum. 2024
yılı itibariyle meslekteki 12. yılımdayım ve amatör olarak uğraştığım zamanı da
sayarsak yaklaşık 15-20 yıldır C bir şekilde hayatımda. Ama genel olarak bir
şeyle fazla vakit geçirmiş olmanız sizi o konuda uzman yapmaz, yıllarca aynı
seviyede kalmış olabilirsiniz. Bu yüzden C dilindeki hakimiyetimi sürekli
arttırmaya çalışıyorum. Bir konudaki bilgi birikimini ve uzmanlığı arttırmanın
en iyi yollarından birinin de o konuda içerik üretmek olduğuna inanıyorum.

Kişilik olarak biraz takıntılı biriyimdir. Bu doğal olarak çalıştığım konulara
da yansıyor. O yüzden bu seride (ürettiğim tüm içeriklerde olduğu gibi) sizlere
olabildiğince doğru bilgiler aktarmaya çalışacağım. Elbette bu hiç hata
yapmayacağım anlamına gelmiyor. Eğer serideki yazılarda hatalar fark ederseniz,
bunları yazılara yorum yazarak ya da doğrudan bana ulaşarak iletirseniz
gerçekten çok memnun olurum.

Planım her ne kadar temellerden başlayıp ilerlemek olsa da bu serinin bir eğitim
serisi olmadığını ve herhangi bir şekilde C bilmeyen birine C'yi öğretmeyi
amaçlamadığını belirtmek isterim. **Bir eğitmen değilim ve sizlere C öğretmek
gibi bir iddiam yok.** Yine de C'yi öğrenen biri iseniz yazıların sizler için
faydalı olacağına eminim. Eğer gerçek bir C kursu arıyorsanız Kaan Aslan (C ve
Sistem Programcıları Derneği, CSD) ya da Necati Ergin tarafından verilen
dersleri almanızı öneririm. Bu kurslar ile ilgili görüşlerimi dile getirmiştim:

{% include ax_single.html reccmode="single" reccyear="23" reccaxseq="15" %}

Bu seride temel olarak kendi tarzımda, C ile konulardan, mümkün olduğunca
mantıksal bir sırada bahsetmeyi hedefliyorum. Hazırsanız gelin başlayalım!

## Yazılar

Bu seride aksini belirtmediğim sürece **C99** standardını temel alacağım.

Sıra ile okumanızı tavsiye ederim (bazı yazılar İngilizce'dir).

<!-- markdownlint-capture -->
<!-- markdownlint-disable -->
{% assign cgunlukleri_posts = site.posts | where_exp:"post", "post.tags contains 'cgunlukleri'" | sort: 'date' %}
<ul>
{% for post in cgunlukleri_posts %}
  <li>
    <a href="{{ post.url | relative_url }}">{{ post.title }}</a>
  </li>
{% endfor %}
</ul>
<!-- markdownlint-restore -->
