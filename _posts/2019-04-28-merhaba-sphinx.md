---
title: "Merhaba Sphinx!"
excerpt: "Jekyll'den Sphinx'e geçtim."
locale: tr_TR
tags: tr
published: true
axseq: 1
---

Blogumla son yıllarda neredeyse hiç ilgilenemiyorum. En son yazımı tam 14 ay
önce yazmışım. Her yazımda daha sık yazmalıyım diye düşünsem de bunu uygulamaya
geçiremiyorum. Bu ufak yazı ile de sitem ile ilgili tarihe not düşmek istiyorum.
Umarım bu altyapı değişikliği daha sık yazı yazmam konusunda da faydalı olur.

Bu siteyi ilk Wordpress ile oluşturmuştum. O zamanlar bir firmadan hosting
hizmeti alıyordum. Wordpress'in gariplikleri bir noktadan sonra canımı sıkmaya
başlamıştı. Birkaç sene önce bir statik site üreticisi olan
[jekyll](https://jekyllrb.com/) kullanmaya başlamıştım. Böylece Wordpress'in
güncellenmesi, hosting sağlayıcısının PHP sürümünü yükseltmemesinden dolayı
yaşanan problemler gibi işlerden kurtulmuş oldum. Daha sonra kendi sunucuma
geçince PHP, MySQL gibi yazılımları idame etmek istemediğim için statik site
yapısında devam ettim.

Şimdi ise yine bir statik site üreten yazılım olan
[Sphinx](https://www.sphinx-doc.org/)'e geçiş yapmış bulunuyorum. Sphinx'i ilk
olarak [comp.arch Notes](https://github.com/alperyazar/comp.arch-notes)
çalışmamda denedim. Jekyll ile temel farklar şu şekilde:

- Jekyll Markdown'u destekliyor. Sphinx de Markdown'u desteklese de temel
  kullanılan işaretleme dili olarak ReST (reStructuredText) kullanıyor. Kullanım
  açısından büyük farklılıklar yok.
- Sphinx daha çok yazılım dokümantasyonu oluşturmak için tasarlanmış bir
  yazılım. Jekyll ise web sitesi yapmak için. Jekyll'nin site yapımı için
  sunduğu özellikler Sphinx'ten daha fazla gibi. Ama çok da kritik değil bence.
- Sphinx Python dilinde, Jekyll ise Ruby dilinde yazılmış. Sphinx'i, Windows'a
  kurmak çok kolay. Jekyll'i Windows'ta denemedim, zorlanacağımı hisettiğim
  için. Onu, Linux dağıtımında bile zor kurup kullanıyordum. Değişiklik yapmamın
  temel sebebi de bu oldu. Ruby'de tam kullanmayı beceremediğim `gem` paket
  yöneticisi var. Arch Linux ve Ubuntu'da Jekyll'i uzun süreli stabil bir
  şekilde kullanamadım.
- Jekyll'nin tema seçenekleri, Sphinx'ten çok daha fazla gibi. Ben şimdilik
  klasik temayı seçtim.

Umuyorum ki ReST'in ve Sphinx'in kullanımı, bu geçişten sonra kullanımdan
kalkmaz ve ben biraz daha sık bir şeyler yazabilirim.
