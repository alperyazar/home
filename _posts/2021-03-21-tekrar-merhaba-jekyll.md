---
title: "Tekrar Merhaba Jekyll!"
excerpt: "Döndüm dolaştım yine Jekyll'ye geçtim."
locale: tr_TR
tags: tr
published: true
axseq: 2
---

Web sitem ve blogumla ilgili değişmeyen tek bir şey var, o da sitenin
altyapısını sürekli değiştirmem. Bu harcadığım zamanı içeriğe harcasam güzel
yazılar veya projeler çıkarabilirdim. 2016 senesinde kullandığım Jekyll'den 2019
yılında uzaklaşmıştım. Şimdi ise
tekrar Jekyll'deyim.

## Neden?

Ayrılma nedenim olarak da Ruby temelli olan bu yazılımı Windows'ta ve Linux'ta
rahat kullanamam olarak belirtmiştim. O zamanlar, şu an kullandığım CI/CD
mantığındaki site derleme ve yayınlama akışı da yoktu. Ben bu konulara çok
uzaktım, belki çok yaygın da değildi, o yüzden siteyi her zaman local'de
derleyip FTP ile çıktıyı sitemin sunucusuna yüklüyordum. Böyle olunca Jekyll'nin
sürekli içerik ürettiğim bilgisayarda düzgün çalışması gerekiyordu. Daha sonra
Sphinx'e geçmiştim, yine aynı akışı kullanarak. Fakat Python temelli olan
Sphinx'i, Ruby temelli olan Jekyll'ye göre daha rahat çalıştırmıştım.

Şimdilerde ise site Github Actions tarafından otomatik derleniyor. Daha önceden
Travis CI kullanıyordum ama gelir modellerini değiştirince ben de Github
Actions'a taşındım, merak da ediyordum. Bu durumda Netlify gibi sistemlerle
entegre ederek de sitenin Github Actions tarafından deploy edilmesinden önce
neye benzeyeceğini doğrudan web üzerinden görmek mümkün. Yani içerik yazdığım
bilgisayarda Jekyll'nin kurulu olması bile gerekmiyor. Sitenin içerini Github'un
web arayüzünden bile güncellemek mümkün. Bu da Jekyll'nin kullanımını
kolaylaştırıyor.

Yine eski dönemlere baktığım zaman günümüzde `gem` ve `bundler` ile Jekyll ve
kullandığım tema olan Minimal Mistakes'i kullanmak kolaylaştı diye düşünüyorum.
2016'da bu işler bu kadar kolay mıydı bilmiyorum çünkü `gem`, `pip` gibi paket
sistemlerini bilmiyordum. O yıllarda Minimal Mistakes'i kullanmak bile zordu
sanırım. Şu anda ise `Gemfile` gibi dosyalarla bir konfigürasyon tutmak ve
Windows/Linux bir sisteme sitenin geliştirme ortamını kurmak çok daha kolay
geliyor. [Dependabot](https://dependabot.com/) ile de güncellemeleri takip etme
işini Github'a yıkınca altyapı işleri de oldukça kolaylaştı.

Bir önceki altyapı MkDocs'tu ve o da bir statik site üreteci aslında. Fakat
yazılım, bir blog, kişisel siteden ziyade biraz daha dokümantasyon amacı ile
tasarlanmış. Böyle olunca da onu bir blog platformu olarak kullanmak daha zor
oluyor. MkDocs'u [asynx.dev](https://asynx.dev/) üzerinde de kullanıyorduk ve bu
özellikleri eklemek için başlamaya niyetlendiğim bir [eklenti
projesi](https://github.com/asynx-dev/mkdocs-asynx-plugin) vardı. Orada da
Jekyll'ye [geçtik](https://asynx.dev/blog/2021/02/jekyll.html) benzer
sebeplerden. İlgilendiğim iki altyapıyı da ortaklamak adına kişisel sitemi de
Jekyll'ye taşıdım.

## Değerlendirme

Geriye dönük baktığım zaman bugüne kadar bu alan adında şimdiye kadar Wordpress,
Jekyll, Dokuwiki, MkDocs ve Sphinx kullandım, belki unuttuğum başka altyapı da
vardır. Wordpress ve Dokuwiki, *dinamik* sistemler olduğu için arkalarında PHP
çalıştıran bir web sunucusuna ihtiyaç duyuyorlar. Diğerleri ise *statik* olarak
bir web sitesi üretiyorlar. Statik üreticiler LaTeX'e benziyor, kaynak kodundan
bir doküman üretiyorlar. Dinamik sistemler ise Microsoft Word gibi denebilir,
içeriğin görüntülenmesi için o yazılıma sürekli ihtiyaç duyuyorlar. Dinamik bir
sisteme sahip olmanın avantajı birçok eklenti ya da sunucuda yazılan ufak
scriptler ile siteye güzel özellikler eklenebilmesi, statik sistemlerde bu biraz
daha zor. Fakat sürekli bir sunucu ile uğraşmak ek bir iş getiriyor. Hosting
hizmeti olsa da kendi sunucunuz olsa da sürekli arkadaki sistemlerin
güncellenmesini, bir miktar güvenliğini düşünmek zorundasınız. Statik araçlarla
üretilmiş bir siteyi Github Pages, Netlify gibi platformlarda sunmak mümkün
olduğundan sunucu tarafı ile hiç uğraşmanız gerekmiyor. Hatta bu platformlar CDN
gibi sistemlerle sitenin daha "güçlü" (örneğin DDoS saldırılarına dayanıklılık
gibi) bir altyapıda sunulmasını sağlıyorlar. Elbette bu servislerin de limitleri
var ama ben onlara henüz uzağım.

Statik site üreteçlerini değerlendirdiğim zaman ise şu çıkarımları yapabilirim:
Bu araçları çalıştırmak için sitenin derleneceği bilgisayara kurulmaları
gerekiyor. Örneğin Sphinx ve MkDocs Python, Jekyll Ruby, denemediğim fakat
derlenme süresi ile fark yarattığını gördüğüm Hugo ise Go temelli. Günümüzde
kullanımı kolaylaşan Github Actions gibi CI/CD sistemlerine geçildiğinde aslında
çalışılan bilgisayara yazılım kurulmasa bile otomasyon sistemleri ile sitenin
derlenmesini sağlamak mümkün. Yazının başlarında belirttiğim gibi önceden Jekyll
kullanımında zorlanıyordum fakat güncel durumda Python temelli bir araç
kullanmaktan daha zor gelmiyor, Go tarafını bilmiyorum. Local'e kurulma
zorunluluğu olmasa da bilgisayarda bulunması işleri kolaylaştırabiliyor elbette.

MkDocs ve Jekyll için ana kaynak format Markdown, Sphinx için ise
reStructuredText. Sphinx Markdown ile de çalıştırılabiliyor ama reST kadar iyi
bir destek sağlanıyor mu bilmiyorum. Sphinx'in çıktılarını arka planda bir web
sunucusu olmadan, çıkan `.html` dosyalarını dosya sistemi üzerinden doğrudan
tarayıcı ile açarak düzgün görüntülemek mümkün. Sanıyorum MkDocs da böyleydi.
Jekyll ise basit de olsa bir web sunucusuna ihtiyaç duyuyor. Jekyll'nin dahili
web sunucusu da kullanılabilir ya da görüntüleme yapılacak platformda Ruby
çalıştırılamıyorsa Python'da dahili bulunan `SimpleHTTPServer` gibi bir araçla
da web sunucusu oluşturulup Jekyll'nin çıktılarına bakılabilir.

Yazıyı geçişi not almak için hazırlıyordum ama beklediğimden uzun oldu, biraz da
karşılaştırma yazısı gibi oldu. Belki bu ve diğer web sitelerindeki
tecrübelerimi de katarak daha kapsamlı bir karşılaştırma yazısı
hazırlayabilirim.
