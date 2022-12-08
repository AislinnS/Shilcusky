setwd("C:/Users/shilcusky/Documents/GitHub/Shilcusky/Dysdera Project")

install.packages("read.csv")
library(read.csv)

library(spdep)
library(adespatial)
library(vegan)


df1 <- read.csv("Dysdera.csv", header =T)
Dysdera <- df1[,c(-2,-3,-5,-8,-9)]
subset(Dysdera, Dysdera$Island == "Lanzarote")


df2 <- read.csv("Dysdera Artificial Brightness.csv", header =T)
Brightness.mat <- as.matrix(df2)
Brightness <- Brightness.mat[,c(-4,-5)]


merge(Dysdera,Brightness, by=c("Latitude","Longitude"))
 ?view
?merge

table(Dysdera$Species)
rarefaction<-function(x,subsample=5, plot=TRUE, color=TRUE, error=FALSE, legend=TRUE, symbol=c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18))
  