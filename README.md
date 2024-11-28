# CustomerSeg-Customer-Segmentation-and-Shopping-Analysis

Kullanılan Kütüphaneler 
Veri kümelemesi için mclust ve dbscan kullanılır.
Veri görselleştirme için ggplot2 ve ggcorrplot kullanılır.
Kümeleme ve modelleme için cluster ve rpart kullanılır. Bu kütüphaneler, veri analizi sürecindeki her aşamayı destekleyen ve çok yönlü çözümler sağlayan araçlardır.

# 1. mclust

Gaussian Mixture Models (GMM) kullanarak kümeleme yapmak için kullanılır. Bu paket, verilerdeki doğal kümeleri belirlemek için bir Gauss karışım modelini uygular ve küme sayısını otomatik olarak seçebilir. Kümeleme algoritmasını çalıştırmak ve sonuçları incelemek için kullanılır. Mclust() fonksiyonu, GMM ile veriyi kümelemenin yanı sıra, modelin doğruluğunu değerlendirmek için BIC ve AIC kriterlerini hesaplar.

# 2. ggplot2

Veriyi görselleştirmek için kullanılan bir paket. Veri analizi sonuçlarını grafiklerle görselleştirmek için kullanılır. Grafikler, veri setini daha iyi anlamak ve bulguları başkalarına iletmek için önemlidir. ggplot() fonksiyonu ile scatter plot, boxplot, histogram gibi görselleştirmeler yapılabilir. Özellikle, kümelenmiş verilerin görselleştirilmesinde kullanılır.

# 3. dbscan

Yoğunluk temelli kümeleme yöntemi olan DBSCAN'i uygulamak için kullanılır. DBSCAN, yoğunluk temelli bir kümeleme algoritmasıdır ve kümelenmemiş noktaları (aykırı değerleri) otomatik olarak algılayabilir. Özellikle, verilerdeki gürültü ve aykırı değerleri tanımlamak için faydalıdır. dbscan() fonksiyonu ile veriyi yoğunluk bazlı kümelemenin yanı sıra, verideki aykırı değerleri (outliers) de tespit edebiliriz.

# 4. cluster

Kümeleme algoritmaları ve araçları sağlamak için kullanılan bir paket. Klasik kümeleme yöntemlerinden biri olan k-means ve hiyerarşik kümeleme gibi farklı kümeleme algoritmalarını içerir. Bu paket, k-means algoritmasının yanı sıra hiyerarşik kümeleme için de fonksiyonlar sağlar. Ayrıca, kümeleri değerlendirmek için çeşitli metrikler içerir.

# 5. rpart

Karar ağaçları (decision tree) modellemesi yapmak için kullanılır. Karar ağaçları, sınıflandırma ve regresyon problemleri için yaygın olarak kullanılır. Bu paket, veriye dayalı bir karar ağacı modelini oluşturmak için gerekli fonksiyonları sağlar. rpart() fonksiyonu ile karar ağacı oluşturulabilir ve bu ağaç üzerinden verinin nasıl sınıflandırılacağını modelleyebiliriz.

# 6. ggcorrplot

Korelasyon ısısı haritası (correlation heatmap) oluşturmak için kullanılır. Bu paket, sürekli değişkenler arasındaki korelasyonu görselleştirmek için oldukça kullanışlıdır. Korelasyon analizi yaparak, hangi değişkenlerin birbirleriyle güçlü ilişkiler içinde olduğunu inceleyebilirsiniz. ggcorrplot() fonksiyonu ile veri setindeki sürekli değişkenlerin korelasyonunu görselleştirebilirsiniz.

