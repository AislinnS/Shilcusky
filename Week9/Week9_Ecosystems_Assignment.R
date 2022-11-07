# For this week it's time to start exploring your own ideas and questions in R.
  # There are at least five options in the dataset to create the following comparisons.
#Where are you setting the working directory to read in your data??
setwd("C:/GitHub/Shilcusky/Week9")
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

invertebrate.means1 <- invertebrate.means[-5,c(-1:-3,-73)]
invertebrate.means2 <- as.data.frame(sapply(invertebrate.means1, as.numeric ))

abiotic.means1 <- abiotic.means[,c(-1,-2,-3,-5,-6,-16)]
abiotic.means2 <- as.data.frame(sapply(abiotic.means1, as.numeric ))

library(vegan)
colnames(abiotic.means2)
ord <- rda(invertebrate.means2 ~ pH + totalN + Perc_ash + Kalium + Magnesium + Ca + Al + TotalP + OlsenP, abiotic.means2)
plot(ord)
anova(ord)

ord <- rda(invertebrate.means2 ~., abiotic.means2)
ord.int <- rda(invertebrate.means2 ~1, abiotic.means2) 

step.mod <- ordistep(ord.int, scope = formula(ord), selection = "both")
step.mod$anova

step.R2mod <- ordiR2step(ord.int, scope = formula(ord), selection = "forward")

# Explain the ecological importance of your significant predictor variables, or the importance if none are significant for your community.

Aluminum is the only signifigant predictor variable with an r2 adjusted value of 0.02. R2 values under 0.00 are non-signifigant, indicating that there is only 1 significant predictor variable.
#Except the p value for Al is 0.175, so it is NOT significant! Don't forget that R squared is only a part of the story.

# (Q2 - 12 pts) Then use the dataset from the tutorial to create a linear model related to your RDA. Try multiple predictors to find the best fit model.


colnames(invertebrate.means2)

mod1 <- lm(invertebrate.means2$Curculionoidea ~ pH ,abiotic.means2)
AIC(mod1)

mod2 <- lm(invertebrate.means2$Curculionoidea ~ totalN ,abiotic.means2)
AIC(mod2)

mod3 <- lm(invertebrate.means2$Curculionoidea ~ Ca,abiotic.means2)
AIC(mod2, mod3)

mod4 <- lm(invertebrate.means2$Curculionoidea ~ TotalP,abiotic.means2)
AIC(mod2,mod3,mod4)

mod5 <- lm(invertebrate.means2$Curculionoidea ~ Magnesium,abiotic.means2)
AIC(mod2,mod3,mod4,mod5)


#Explain the ecological importance of the significant predictors, or lack of significant predictors.

The effect of some predictors being removed, such as magnesium and totalP, do not have a significant ecological importance because while their removal slightly alters the position of data points,it does not result in the production of a linear model. 
#All of these produce a linear model! That is what lm() is doing.
#You did not test the significance of any of these models or look at the summary output to interpret the relationship between them with anova() or summary()

# (Q3 - 6 pts) Provide a 3-4 sentence synthesis of how these results relate to one another and the value of considering both together for interpreting biotic-abiotic interactions.

mod6 <- lm(invertebrate.means2$Curculionoidea ~ pH * totalN, abiotic.means2)
AIC(mod2,mod3,mod4,mod5,mod6)

The minimal shift of the overall composition of the data points on the graph after the removal of various indicators shows that the majority of ecological predictors present are insignificant. 
Abiotic factors can limit or reduce the influence of biotic factors by limiting them because they are ultimatally connected in a feedback loop. 
The structure of the environment affects its functions, in turn affecting the cological composotion and processes in an ecosystem. 
An additive model can be used to determine the significance of predictor variables effects and an interactive model, which multiplies the variables together, can be used as well. 
In an additive model, factors are not necessarily limiting or relying on eachother, but in an interactive model they directly are reliant on and affect one another. 

#How do the linear models and rda relate to each other? What graphs are you talking about? You only plotted one rda so there is nothing for comparison.
#This answer was supposed to be a synthesis for your specific results.
#Also, never use "insignificant" when talking about stats!