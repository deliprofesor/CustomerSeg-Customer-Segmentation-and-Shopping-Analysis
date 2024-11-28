
install.packages("dbscan")
install.packages("mclust")
install.packages("ggcorrplot")
library(mclust)
library(ggplot2)
library(dbscan)
library(cluster)
library(rpart)
library(ggcorrplot)

# Veriyi yükleme
data <- read.csv("C:\\Users\\LENOVO\\Desktop\\now28\\Wholesale_customers_data.csv")

head(data)
str(data)
summary(data)

# Sayısal sütunları seçme 
numerical_data <- data[, c("Fresh", "Milk", "Grocery", "Frozen", "Detergents_Paper", "Delicassen")]


scaled_data <- scale(numerical_data)
head(scaled_data)

# Elbow yöntemini uygulama
wss <- numeric(15)
for (k in 1:15) {
  kmeans_model <- kmeans(scaled_data, centers = k, nstart = 25)
  wss[k] <- kmeans_model$tot.withinss
}

# Elbow grafiğini çizme
plot(1:15, wss, type = "b", main = "Elbow Method", xlab = "Küme Sayısı", ylab = "İçsel Dağılım")

sil_score <- numeric(15)
for (k in 2:15) {
  kmeans_model <- kmeans(scaled_data, centers = k, nstart = 25)
  sil_score[k] <- silhouette(kmeans_model$cluster, dist(scaled_data))[, 3]
}

# Silhouette skorunu çizme
plot(2:15, sil_score[2:15], type = "b", main = "Silhouette Score", xlab = "Küme Sayısı", ylab = "Silhouette Skoru")


sil_score <- numeric(15)
for (k in 2:15) {
  kmeans_model <- kmeans(scaled_data, centers = k, nstart = 25)
  sil_score[k] <- silhouette(kmeans_model$cluster, dist(scaled_data))[, 3]
}

# Silhouette skorunu çizme
plot(2:15, sil_score[2:15], type = "b", main = "Silhouette Score", xlab = "Küme Sayısı", ylab = "Silhouette Skoru")

# K-Means kümelemesi (3 küme)
set.seed(123)  
kmeans_model <- kmeans(scaled_data, centers = 3, nstart = 25)

# Küme etiketlerini ekleyelim
data$Cluster <- as.factor(kmeans_model$cluster)

# Kümeleme sonuçlarını inceleyelim
table(data$Cluster)

# PCA ile boyut indirgeme
pca <- prcomp(scaled_data)

# PCA sonuçlarını veri setine ekleme
data_pca <- data.frame(pca$x[, 1:2], Cluster = data$Cluster)

# PCA sonuçlarını görselleştirme

ggplot(data_pca, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point() +
  labs(title = "PCA ile Kümeleme Sonuçları", x = "PC1", y = "PC2")

# DBSCAN ile kümeleme (eps ve minPts'yi belirleyelim)
dbscan_model <- dbscan(scaled_data, eps = 0.5, minPts = 5)

# Kümeleme sonuçlarını inceleyelim
table(dbscan_model$cluster)

# Küme etiketlerini veri setine ekleyelim
data$DBSCAN_Cluster <- as.factor(dbscan_model$cluster)

# DBSCAN kümeleme sonuçlarını inceleyelim
head(data)
# PCA ile boyut indirgeme
pca_dbscan <- prcomp(scaled_data)

# PCA sonuçlarını veri setine ekleme
data_pca_dbscan <- data.frame(pca_dbscan$x[, 1:2], DBSCAN_Cluster = data$DBSCAN_Cluster)

# PCA sonuçlarını görselleştirme

ggplot(data_pca_dbscan, aes(x = PC1, y = PC2, color = DBSCAN_Cluster)) +
  geom_point() +
  labs(title = "DBSCAN ile Kümeleme Sonuçları (PCA)", x = "PC1", y = "PC2")

# GMM kümeleme
gmm_model <- Mclust(scaled_data)

# Küme etiketlerini ekleyelim
data$GMM_Cluster <- as.factor(gmm_model$classification)

# GMM modelinin özeti
summary(gmm_model)

# Kümeleme sonuçlarını inceleyelim
table(data$GMM_Cluster)

# PCA ile boyut indirgeme
pca_gmm <- prcomp(scaled_data)

# PCA sonuçlarını veri setine ekleme
data_pca_gmm <- data.frame(pca_gmm$x[, 1:2], GMM_Cluster = data$GMM_Cluster)

# PCA sonuçlarını görselleştirme

ggplot(data_pca_gmm, aes(x = PC1, y = PC2, color = GMM_Cluster)) +
  geom_point() +
  labs(title = "GMM ile Kümeleme Sonuçları (PCA)", x = "PC1", y = "PC2")
# BIC ve AIC değerlerini görmek
bic_value <- gmm_model$bic
aic_value <- gmm_model$aic

# Değerleri yazdırma
cat("BIC: ", bic_value, "\n")
cat("AIC: ", aic_value, "\n")

# Farklı küme sayıları ile GMM modeli denemek
gmm_model_2 <- Mclust(scaled_data, G = 2)  # 2 küme
gmm_model_3 <- Mclust(scaled_data, G = 3)  # 3 küme

# Kümeleme sonuçları
table(gmm_model_2$classification)
table(gmm_model_3$classification)

# Boxplot ile aykırı değerleri görselleştirme

ggplot(data, aes(x = "", y = Fresh)) +
  geom_boxplot() +
  labs(title = "Fresh Ürün için Aykırı Değerler")

# Diğer kategoriler için de benzer şekilde boxplot çizilebilir
# Aykırı değerleri tespit etme (Fresh sütunu için örnek)
Q1 <- quantile(data$Fresh, 0.25)
Q3 <- quantile(data$Fresh, 0.75)
IQR <- Q3 - Q1

# Aykırı değerler
outliers <- data$Fresh < (Q1 - 1.5 * IQR) | data$Fresh > (Q3 + 1.5 * IQR)
sum(outliers)  # Aykırı değerlerin sayısı
# Korelasyon analizi
correlation_matrix <- cor(scaled_data)

# Korelasyon matrisini görselleştirme

ggcorrplot(correlation_matrix, lab = TRUE, title = "Korelasyon Isısı Haritası")
# PCA uygulama
pca <- prcomp(scaled_data)

# PCA sonuçlarını özetleme
summary(pca)

# PCA ile boyut indirgeme sonuçlarını görselleştirme
pca_data <- data.frame(pca$x[, 1:2], Cluster = data$Cluster)
ggplot(pca_data, aes(x = PC1, y = PC2, color = Cluster)) +
  geom_point() +
  labs(title = "PCA ile Boyut İndirgeme Sonuçları")
# Channel ve Region arasındaki ilişkiyi test etme
table_channel_region <- table(data$Channel, data$Region)
chisq_test <- chisq.test(table_channel_region)

# Sonuçları görselleştirme
chisq_test

# İlişkiyi görselleştirmek için barplot
ggplot(data, aes(x = Channel, fill = Region)) +
  geom_bar(position = "fill") +
  labs(title = "Channel ve Region İlişkisi")
# Kümeleme sonuçlarının karşılaştırılması
cluster_summary <- data %>%
  group_by(Cluster) %>%
  summarise(across(Fresh:Delicassen, list(mean = mean, sd = sd)))

print(cluster_summary)
# Decision Tree (Karar Ağaçları) Sınıflandırması

model <- rpart(Channel ~ Fresh + Milk + Grocery + Frozen + Detergents_Paper + Delicassen, data = data, method = "class")
summary(model)

# Karar ağacını görselleştirme
library(rpart.plot)
rpart.plot(model)
