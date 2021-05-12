df_q3 <- read.csv(choose.files())
df_q3 <- na.omit(df_q3)
df_q3 <- scale(df_q3)


FreqFlyer<- hclust(d=dist(df_q3))
plot(FreqFlyer)
#4 clusters look significant
#If you don't normalize the data, it can be heavily skewed based on how small or large different variable's data is. Data with very big values could heavily outweigh data with small values 



library(dplyr)
df_partition <- data.frame(df_q3)
Q3partition <- sample_n(df_partition, .95*3999)


FreqFlyer_partition <- hclust(d=dist(Q3partition))
plot(FreqFlyer_partition)
#Clusters look pretty similar but .95 has a few less


set.seed(23983)
Kmeans10 <- kmeans(x = df_q3, centers = 4)
Kmeans10
library(useful)
plot(Kmeans10, data = df_q3)



