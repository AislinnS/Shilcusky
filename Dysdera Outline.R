setwd("C:/GitHub/Shilcusky/Dysdera.csv")
library(readcsv)

library(spdep)
library(adespatial)
library(vegan)

Dysdera.csv <- read.csv("Dysdera.csv", header =T)
Dysdera.mat <- as.matrix(Dysdera.csv[,-1])

