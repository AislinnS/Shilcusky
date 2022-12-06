setwd("C:/GitHub/Shilcusky/Dysdera.csv")
library(readcsv)

library(spdep)
library(adespatial)
library(vegan)

df <- read.csv("Dysdera.csv", header =T)
Dysdera.mat <- as.matrix(df)

Dysdera.mat[,c(-2,-3,-5,-8,-9)]
group <- Dysdera.mat[,c(-2,-3,-5,-8,-9)]
