setwd("C:/Shilcusky/Documents/GitHub/Shilcusky/Dysdera Project")
library(spdep)
library(adespatial)
library(vegan)

df1 <- read.csv("Dysdera.csv", header =T)
Dysdera <- df1[,c(-2,-3,-5,-8,-9)]
subset(Dysdera, Dysdera$Island == "Lanzarote")
Subset <- subset(Dysdera, Dysdera$Island == "Lanzarote")
?subset



df2 <- read.csv("Dysdera Artificial Brightness.csv", header =T)
Brightness.mat <- as.matrix(df2)
Brightness <- Brightness.mat[,c(-4,-5)]


merge(Dysdera,Brightness, by=c("Latitude","Longitude"))
?view
?merge

FiveIslands <- subset(Dysdera, Dysdera$Island == "Lanzarote")
table(Subset$Species)
FiveIslands <- as.matrix(Subset)

agg_mean = aggregate(iris[,1:4],by=list(iris$Species),FUN=mean, na.rm=TRUE)
agg_mean


FiveIslands <- table(Subset$Species)

aggregate(FiveIslands, by, FUN, …, simplify = TRUE, drop = TRUE))
?aggregate

island+species

rarefaction<-function(x,subsample=5, plot=TRUE, color=TRUE, error=FALSE, legend=TRUE, symbol=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18))
  