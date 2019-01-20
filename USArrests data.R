set.seed(123)

# Load the data
data("USArrests")
# Subset of USArrests
ss <- sample(1:50, 20)
df <- scale(USArrests[ss,])

# Compute fuzzy clustering
library(e1071)
cm <- cmeans(df, 4)
cm
head(cm$membership)
library(corrplot)
corrplot(cm$membership, is.corr = FALSE)
cm$cluster
library(factoextra)
fviz_cluster(list(data = df, cluster=cm$cluster), 
             ellipse.type = "norm",
             ellipse.level = 0.68,
             palette = "jco",
             ggtheme = theme_minimal())

#souce: https://www.datanovia.com/en/lessons/fuzzy-clustering-essentials/cmeans-r-function-compute-fuzzy-clustering/
