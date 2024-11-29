# CustomerSeg-Customer-Segmentation-and-Shopping-Analysis


![image](https://github.com/user-attachments/assets/a1d2ccf2-0eb9-4482-bac5-709940ab48a6)

# Kullanılan Kütüphaneler 

- **Veri kümelemesi için mclust ve dbscan kullanılır.**
- **Veri görselleştirme için ggplot2 ve ggcorrplot kullanılır.**
- **Kümeleme ve modelleme için cluster ve rpart kullanılır.**

mclust: Gaussian Mixture Models (GMM) kullanarak kümeleme yapmak için kullanılır. Bu paket, verilerdeki doğal kümeleri belirlemek için bir Gauss karışım modelini uygular ve küme sayısını otomatik olarak seçebilir. Kümeleme algoritmasını çalıştırmak ve sonuçları incelemek için kullanılır. Mclust() fonksiyonu, GMM ile veriyi kümelemenin yanı sıra, modelin doğruluğunu değerlendirmek için BIC ve AIC kriterlerini hesaplar.

ggplot2: Veriyi görselleştirmek için kullanılan bir paket. Veri analizi sonuçlarını grafiklerle görselleştirmek için kullanılır. Grafikler, veri setini daha iyi anlamak ve bulguları başkalarına iletmek için önemlidir. ggplot() fonksiyonu ile scatter plot, boxplot, histogram gibi görselleştirmeler yapılabilir. Özellikle, kümelenmiş verilerin görselleştirilmesinde kullanılır.

dbscan: Yoğunluk temelli kümeleme yöntemi olan DBSCAN'i uygulamak için kullanılır. DBSCAN, yoğunluk temelli bir kümeleme algoritmasıdır ve kümelenmemiş noktaları (aykırı değerleri) otomatik olarak algılayabilir. Özellikle, verilerdeki gürültü ve aykırı değerleri tanımlamak için faydalıdır. dbscan() fonksiyonu ile veriyi yoğunluk bazlı kümelemenin yanı sıra, verideki aykırı değerleri (outliers) de tespit edebiliriz.

cluster: Kümeleme algoritmaları ve araçları sağlamak için kullanılan bir paket. Klasik kümeleme yöntemlerinden biri olan k-means ve hiyerarşik kümeleme gibi farklı kümeleme algoritmalarını içerir. Bu paket, k-means algoritmasının yanı sıra hiyerarşik kümeleme için de fonksiyonlar sağlar. Ayrıca, kümeleri değerlendirmek için çeşitli metrikler içerir.

rpart: Karar ağaçları (decision tree) modellemesi yapmak için kullanılır. Karar ağaçları, sınıflandırma ve regresyon problemleri için yaygın olarak kullanılır. Bu paket, veriye dayalı bir karar ağacı modelini oluşturmak için gerekli fonksiyonları sağlar. rpart() fonksiyonu ile karar ağacı oluşturulabilir ve bu ağaç üzerinden verinin nasıl sınıflandırılacağını modelleyebiliriz.

ggcorrplot: Korelasyon ısısı haritası (correlation heatmap) oluşturmak için kullanılır. Bu paket, sürekli değişkenler arasındaki korelasyonu görselleştirmek için oldukça kullanışlıdır. Korelasyon analizi yaparak, hangi değişkenlerin birbirleriyle güçlü ilişkiler içinde olduğunu inceleyebilirsiniz. ggcorrplot() fonksiyonu ile veri setindeki sürekli değişkenlerin korelasyonunu görselleştirebilirsiniz.


Bu proje, toptan müşterilere ait verilerde çeşitli analiz ve kümeleme yöntemlerini kullanarak veri keşfi, segmentasyon, modelleme ve görselleştirme işlemlerini gerçekleştirmeyi amaçlamaktadır. 


- **Toptan müşterilere ilişkin veriyi anlamak, temel istatistiklerini incelemek ve veri setindeki kalıpları belirlemek.**
- **Müşterileri satın alma davranışlarına göre gruplara ayırmak (segmentasyon) ve farklı kümeleme algoritmalarını (K-Means, DBSCAN, GMM) karşılaştırmak.**
- **PCA (Principal Component Analysis) ile veriyi görselleştirmek ve kümelerin ayrılabilirliğini analiz etmek.**
- **Karar ağacı kullanarak, müşterilerin belirli özelliklerine göre hangi kanaldan (Channel) olduğu hakkında tahmin yapmak.**
- **Farklı değişkenler arasındaki ilişkileri  test etmek.**
- **Elde edilen sonuçları grafiklerle anlamlandırmak ve aykırı değerleri analiz etmek.**
  

# Veriyi Yükleme ve Ön İşleme

Veri setini analiz etmek, normalize etmek ve kümeleme için uygun hale getirildi. Veri seti bir CSV dosyasından yüklendi. head(), str(), ve summary() fonksiyonları ile veri incelendi. Verinin sadece sayısal sütunları seçilerek, bu sütunlar normalize edildi (scale()).


# Kümeleme Algoritmaları

# K-Means Kümelemesi

Müşteri segmentlerini tanımlamak ve her grubun özelliklerini analiz etmek için K-Means  kullanıldı.  Küme sayısını belirlemek için Elbow Yöntemi ve Silhouette Skoru kullanıldı. Veriler, 3 küme olacak şekilde K-Means algoritmasıyla segmentlere ayrıldı. Her bir küme için temel istatistikler hesaplandı.

![elbow](https://github.com/user-attachments/assets/63232d0a-e047-43b1-9f64-123c49f2d1f9)

![silhouette](https://github.com/user-attachments/assets/93a6f240-067e-4169-a284-295fded31504)

![silhouette-score](https://github.com/user-attachments/assets/3dc1235e-a3a4-4a51-a97a-deedeba42683)


# DBSCAN Kümelemesi

K-Means ile kıyaslanabilir alternatif bir kümeleme yöntemi denemek için DSBCAN kümelemesi kullanıldı. DBSCAN algoritması, yoğunluk temelli kümeleme için kullanıldı. eps (komşuluk yarıçapı) ve minPts (minimum komşu sayısı) parametreleri belirlendi. DBSCAN kümeleri PCA ile görselleştirildi.


![DSBCAN_PCA](https://github.com/user-attachments/assets/4d04ec9f-00d9-4ff9-a890-0312db832c67)


# GMM (Gaussian Mixture Model) Kümelemesi

K-Means ve DBSCAN’e ek olarak, verilerdeki olası karmaşık yapıları yakalamak için GMM kümelemesi kullanıldı. Veriler, GMM kullanılarak kümelendi. BIC (Bayesian Information Criterion) ve AIC (Akaike Information Criterion) değerleri hesaplandı. Farklı küme sayıları denenerek en iyi model seçildi.

![GMM_PCA](https://github.com/user-attachments/assets/783f767d-de97-4943-b614-c0a26d83033a)

# Boyut İndirgeme ve Görselleştirme

Kümelerin görsel olarak ayrılabilirliğini analiz etmek ve boyut indirgeme tekniklerini uygulandı. PCA (Principal Component Analysis) ile veri boyutu 2’ye indirildi. PCA sonuçları kullanılarak K-Means, DBSCAN ve GMM kümeleri görselleştirildi.
![PCA](https://github.com/user-attachments/assets/8bfaa9cb-2337-496e-8f0c-67e83343b79b)

![PCA_boyut_indirgeme](https://github.com/user-attachments/assets/b582d151-de5f-48aa-ac91-52d9bee609b8)


# Aykırı Değer Analizi

Veri setindeki olası aykırı değerleri analiz etmek ve veri kalitesini değerlendirildi. Aykırı değerler IQR (Interquartile Range) yöntemiyle tespit edildi. Boxplot kullanılarak aykırı değerlerin görselleştirilmesi sağlandı.

![Fresh_aykırı_değerler](https://github.com/user-attachments/assets/a349d03d-77e3-418d-a77c-dd355a8357cd)

# İlişki Analizi

Kategorik değişkenler arasındaki anlamlı ilişkileri incelendi. Channel (müşteri tipi) ve Region (bölge) değişkenleri arasındaki ilişki, Ki-Kare Testi ile analiz edildi. Barplot grafikleri ile bu ilişki görselleştirildi.

# Karar Ağacı (Decision Tree) Modeli

Müşterilerin özelliklerine dayanarak kanal tahmini yapıldı ve sınıflandırma performansını ölçüldü. Channel (müşteri tipi) tahmini için karar ağacı modeli oluşturuldu. Veri seti eğitim (%70) ve test (%30) olarak bölündü. Test verisinde tahmin yapılarak modelin doğruluk oranı ve karmaşıklık matrisi hesaplandı. Karar ağacı grafiği çizilerek modelin yapısı görselleştirildi.

![karar_ağacı](https://github.com/user-attachments/assets/8ef695bb-d4cc-44cf-9962-14e537dfa44e)

# Korelasyon Analizi

Sayısal değişkenler arasındaki ilişkileri analiz edildi. Tüm sayısal sütunlar arasındaki korelasyonlar hesaplandı. Korelasyon matrisinin görselleştirilmesi için ısı haritası (ggcorrplot) oluşturuldu.

![korelasyon](https://github.com/user-attachments/assets/5a15e39c-05b4-4bca-9d00-205663f6c825)


