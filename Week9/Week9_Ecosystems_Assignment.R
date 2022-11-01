# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.

library(readxl)

invertebrate.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Invertebrate_community")
invertebrate <- as.data.frame(invertebrate.tibble)

abiotic.tibble <- read_excel("Penaetal_2016_data.xlsx", sheet = "Abiotic factors")
abiotic <- as.data.frame(abiotic.tibble)

head(invertebrate)
head(abiotic)

invertebrate.names <- paste(invertebrate$Land_use, invertebrate$Parcel)
invertebrate$names <- invertebrate.names

abiotic.names <- paste(abiotic$Land_Use, abiotic$Parcel)
abiotic$names <- abiotic.names

invertebrate.means <- aggregate(x = invertebrate, by = list(invertebrate$names), FUN = "mean")
head(invertebrate.means)

abiotic.means <- aggregate(x = abiotic, by = list(abiotic$names), FUN = "mean")
head(abiotic.means)

# (Q1 - 12 pts) Use the dataset from the tutorial to complete one redundancy analysis (RDA) with variance partitioning on a different community (NOT the nematodes).
  # Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.

invertebrate.means1 <- invertebrate.means[-5,c(-1:-3,-73)]
invertebrate.means2 <- as.data.frame(sapply(invertebrate.means1, as.numeric ))

abiotic.means1 <- abiotic.means[,c(-1,-2,-3,-5,-6,-16)]
abiotic.means2 <- as.data.frame(sapply(abiotic.means1, as.numeric ))


# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.

library(vegan)
colnames(abiotic.means2)
ord <- rda(invertebrate.means2 ~ totalN, abiotic.means2)
plot(ord)
anova(ord)

fit.nbinom <- fitdist(soil.plants$Leaves, distr = "nbinom")

# Explain the ecological importance of the significant predictors, or lack of significant predictors.

The f value typically shows significance, but nitrogen, our predictor variable, does not show statistical significance at 0.7111.

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.

