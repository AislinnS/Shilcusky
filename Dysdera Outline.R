setwd("C:/Users/shilcusky/Documents/GitHub/Shilcusky/Dysdera Project")
library(readcsv)

library(spdep)
library(adespatial)
library(vegan)


df1 <- read.csv("Dysdera.csv", header =T)
Dysdera <- df1[,c(-2,-3,-5,-8,-9)]
subset(Dysdera, Dysdera$Island == "Lanzarote")


df2 <- read.csv("Dysdera Artificial Brightness.csv", header =T)
Brightness.mat <- as.matrix(df2)


merge(Dysdera,Dysdera_Artificial_Brightness, by=c ("Latitude","Longitude"))
      
      