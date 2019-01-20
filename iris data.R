library(ppclust)
library(factoextra)
library(cluster)
library(fclust)
data(iris)
x=iris[,-5]
x
pairs(x, col=iris[,5])
res.fcm <- fcm(x, centers=3)
v0 <- matrix(nrow=3, ncol=4,
             c(5.0, 3.4, 1.4, 0.3,
               6.7, 3.0, 5.6, 2.1,
               5.8, 2.7, 4.3, 1.4),
             byrow=TRUE)
print(v0)
res.fcm <- fcm(x, centers=v0)
v0 <- inaparc::kmpp(x, k=3)$v
print(v0)
res.fcm <- fcm(x, centers=v0)
u0 <- inaparc::imembrand(nrow(x), k=3)$u
res.fcm <- fcm(x, centers=3, memberships=u0)
res.fcm <- fcm(x, centers=3, alginitv="hartiganwong", alginitu="imembrand")
res.fcm <- fcm(x, centers=3, dmetric="correlation")
res.fcm <- fcm(x, centers=3, m=4)
res.fcm <- fcm(x, centers=3)
as.data.frame(res.fcm$u)
res.fcm$v0
res.fcm$v
summary(res.fcm)
res.fcm$comp.time
