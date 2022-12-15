#Set working directory
setwd("C:/Shilcusky/Documents/GitHub/Shilcusky/Dysdera Project")
#Load in data packages for later use
library(vegan)

#Read data csv. of geographical distribution of Dysdera species in the Canary Islands
df1 <- read.csv("Dysdera.csv", header =T)
Dysdera <- df1[,c(-2,-3,-5,-8,-9)]
subset(Dysdera, Dysdera$Island == "Lanzarote")
Subset <- subset(Dysdera, Dysdera$Island == "Lanzarote")

#Reading in the data for the artificial brightness values obtained from each point of latitude + longitude
df2 <- read.csv("Dysdera Artificial Brightness.csv", header =T)
#Creating a new matrix
Brightness.mat <- as.matrix(df2)
#Removing unnecessary columns
Brightness <- Brightness.mat[,c(-4,-5)]

#Merging the 2 datasets together by the uniting factor of Latitude and Longitude
merge(Dysdera,Brightness, by=c("Latitude","Longitude"))

#New dataframe created to indicate that each species is being treated as if it were its own island. Only Lanzarote Dysdera are being observed
FiveIslands <- subset(Dysdera, Dysdera$Island == "Lanzarote")
table(Subset$Species)
#Creating a usable matrix with the data
FiveIslands <- as.matrix(Subset)

#Function to give each row its own unique number
Subset$Count <- 1
#Using an aggregate function to obtain a sum of individuals present for each of the 5 Dysdera species
df2<- aggregate(Subset$Count, by= list(Subset$Species),FUN=sum)

#Changing the name of the dataframe for clarity's sake
SpeciesCount <- df2

#Plotting location of all 74 individuals on Lanzarote relative to Latitude and Longitude
plot(Subset$Longitude,Subset$Latitude, col = 10)
summary(Subset)
#Added to help obtain the smoothest rarefaction curve pathway, small increments
bb <-0.053
dd <-0.01

#Creating more precise quadrants to obtain the number of species from. Increasing area by increments of 0.01
#growth = delta*Area number + base
Area1<- subset(Subset, Subset$Latitude>(29.16-(bb)) & Subset$Latitude<(29.19+(bb)) & Subset$Longitude>(-13.57-(bb)) & Subset$Longitude<(-13.57+(bb)))
plot(Area1$Longitude,Area1$Latitude, col = 10)
Area1Count<- aggregate(Area1$Count, by= list(Area1$Species),FUN=sum)

Area2<- subset(Subset, Subset$Latitude>(29.16-(bb+1*dd)) & Subset$Latitude<(29.19+(bb+1*dd)) & Subset$Longitude>(-13.57-(bb+1*dd)) & Subset$Longitude<(-13.57+(bb+1*dd)))
plot(Area2$Longitude,Area2$Latitude, col = 10)
Area2Count<- aggregate(Area2$Count, by= list(Area2$Species),FUN=sum)

Area3<- subset(Subset, Subset$Latitude>(29.16-(bb+2*dd)) & Subset$Latitude<(29.19+(bb+2*dd)) & Subset$Longitude>(-13.57-(bb+2*dd)) & Subset$Longitude<(-13.57+(bb+2*dd)))
plot(Area3$Longitude,Area3$Latitude, col = 10)
Area3Count<- aggregate(Area3$Count, by= list(Area3$Species),FUN=sum)

Area4<- subset(Subset, Subset$Latitude>(29.16-(bb+3*dd)) & Subset$Latitude<(29.19+(bb+3*dd))& Subset$Longitude>(-13.57-(bb+3*dd)) & Subset$Longitude<(-13.57+(bb+3*dd)))
plot(Area4$Longitude,Area4$Latitude, col = 10)
Area4Count<- aggregate(Area4$Count, by= list(Area4$Species),FUN=sum)

Area5<- subset(Subset, Subset$Latitude>(29.16-0.205) & Subset$Latitude<(29.19+0.205) & Subset$Longitude>(-13.57-0.205) & Subset$Longitude<(-13.57+0.205))
plot(Area5$Longitude,Area5$Latitude, col = 10)
Area5Count<- aggregate(Area5$Count, by= list(Area5$Species),FUN=sum)

Area6<- subset(Subset, Subset$Latitude>(29.16-0.23) & Subset$Latitude<(29.19+0.23) & Subset$Longitude>(-13.57-0.23) & Subset$Longitude<(-13.57+0.23))
plot(Area6$Longitude,Area6$Latitude, col = 10)
Area6Count<- aggregate(Area6$Count, by= list(Area6$Species),FUN=sum)

Area7<- subset(Subset, Subset$Latitude>(29.16-0.4) & Subset$Latitude<(29.19+0.4) & Subset$Longitude>(-13.57-0.4) & Subset$Longitude<(-13.57+0.4))
plot(Area7$Longitude,Area7$Latitude, col = 10)
Area7Count<- aggregate(Area7$Count, by= list(Area7$Species),FUN=sum)

#The area of each quadrant has been calculated in a separate excel sheet by squaring the edge distance, which was configurated by increasing the scalar values, which were found by increasing (0.053) by increments of dd (0.01) for each area
Area <- c(0.011236, 0.015876,0.021316,0.027556, 0.034596, 0.042436, 0.051076)
#The aggregate function was used to do a species count of each Area
Richness <-c(3,4,5,5,5,5,5)

#Create a new dataframe of Area by Richness
RichnessArea <- data.frame(Area,Richness)
#Plot the rarefaction curve to find species richness, add main heading and change x and y labels, add some color and pizazz 
plot(RichnessArea$Area, RichnessArea$Richness, type = "b", xlab = "Area (degrees squared)", ylab = "Number of species", main = "Number of species per Area", pch =10, col= 2)

#Rarefaction Curve Done, Histogram Time

#The columns including latitude and longitude are being excluded from the original matrix
DysderaAndBright<- Brightness.mat[,c(-2,-3)]
#A histogram will be created to graph artificial brightness against number of individuals
hist(DysderaAndBright, xlab = "Artificial Brightness (μcd/m2)", ylab = "Number of Individuals", main ="Dysdera Distribution in Relation to Artificial Brightness", col = "orange", border = "black")

############AND SCENE##############



