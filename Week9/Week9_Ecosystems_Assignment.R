# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.

library(readxl)
vegetation.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Vegetation_transects")
vegetation <- as.data.frame(vegetation.tibble)

invertebrate.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Invertebrate_community")
invertebrate <- as.data.frame(invertebrate.tibble)

head(vegetation)
head(invertebrate)

boxplot(pH ~ Site, data= abiotic, main = "pH by Parcel")
boxplot(pH ~ Land_Use, data= abiotic, main = "pH by Land Use")
abiotic.names <- paste(abiotic$Site, abiotic$Land_Use, abiotic$Plot)

vegetation.names <- paste(vegetation$Land_Use, vegetation$Parcel)
vegetation$names <- vegetation.names

invertebrate.names <- paste(invertebrate$Land_use, invertebrate$Parcel)
invertebrate$names <- invertebrate.names

vegetation.means <- aggregate(x = vegetation, by = list(vegetation$names), FUN = "mean")
head(vegetation.means)

invertebrate.means <- aggregate(x = invertebrate, by = list(invertebrate$names), FUN = "mean")
head(invertebrate.means)



maybe use abiotic instead of vegetation
find column to replace something with
# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.

abiotic$names==invert$names
[,4:12]
th.np <-df[,c.-2,-3,-5]

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.
  # Explain the ecological importance of the significant predictors, or lack of significant predictors.

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.


