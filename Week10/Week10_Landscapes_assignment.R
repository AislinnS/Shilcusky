# Load the packages from this week's tutorial.
#In the tutorial we looked at the community as a whole and the swimmers which ultimately matched a prediction we had for their distribution.

#Part 1: Look at two other subsets of the community and determine the relative influence of space and habitat on each following the methods in the tutorial. (10 points)
#The options include groupings by taxonomy, where Diptera (true flies) have the strongest flight ability, Trichoptera the 2nd strongest, 
    #Ephememeroptera are 3rd, and non insects are 4th...because they don't have wings.
#Groupings by habits include the swimmers (off limits for the assignment) as most mobile, sprawlers as 2nd (they move in search of food, but not quickly),
    #and the clingers come in last (they might move up and down on individual rocks).

library(spdep)
library(adespatial)
library(vegan)

PatchLatLon.csv <- read.csv("PatchLatLon.csv", header=T)
BugsByPatch.csv <- read.csv("BugsByPatch.csv", header=T)
HabitatbyPatch.csv <- read.csv("HabitatbyPatch.csv", header=T)
Swimmers.csv <- read.csv("Swimmers.csv", header=T)

PatchLatLon.mat <- as.matrix(PatchLatLon.csv[,-1])
BugsByPatch.mat <- as.matrix(BugsByPatch.csv)
HabitatbyPatch.mat <- as.matrix(HabitatbyPatch.csv)
Swimmers.mat <- as.matrix(Swimmers.csv)

Diptera.csv <- read.csv("Diptera.csv")
Diptera.mat <- as.matrix(Diptera.csv)

Clingers.csv<- read.csv("Clingers.csv")
Clingers.mat <- as.matrix(Clingers.csv)

nb<-cell2nb(3,30,"queen")
nb1 <- droplinks(nb, 19, sym=TRUE)
nb2 <- droplinks(nb1, 22, sym=TRUE)
nb3 <- droplinks(nb2, 25, sym=TRUE)
nb4 <- droplinks(nb3, 30, sym=TRUE)

bin.mat <- aem.build.binary(nb4, PatchLatLon.mat, unit.angle = "degrees", rot.angle = 90, rm.same.y = TRUE, plot.connexions = TRUE)
plot(PatchLatLon.mat[,2]~PatchLatLon.mat[,3], xlim = rev(c(76.75,77)))

aem.ev <- aem(aem.build.binary=bin.mat)
aem.df <- aem.ev$vectors[c(-19,-22,-25,-30),]
aem.df

Space.rda <- rda(Diptera.mat, as.data.frame(aem.df))
Space.r2a <- RsquareAdj(Space.rda)$adj.r.squared

aem.fwd <- forward.sel(Diptera.mat,aem.df, adjR2thresh=Space.r2a)
aem.fwd$order

SpaceNoHab.rda <- rda(Diptera.mat, as.data.frame(aem.df[,aem.fwd$order]), HabitatbyPatch.mat)
SpaceNoHab.rda 
anova(SpaceNoHab.rda, perm.max = 10000)
RsquareAdj(SpaceNoHab.rda)

HabNoSpace.rda <- rda(Diptera.mat, HabitatbyPatch.mat, as.data.frame(aem.df[,aem.fwd$order]))
HabNoSpace.rda 
anova(HabNoSpace.rda, perm.max = 10000)
RsquareAdj(HabNoSpace.rda)

#Where are the clinger RDAs??


#Part 2: What is your interpretation of the pattern for each group individually, and the two in comparison, based on their mobility? (5 points)

Constrained for the SpaceNoHabitat has the larger proportion at 0.4336, therefore this means that space and habitat can act independently on a community. Diptera have the strongest flight ability, therefore their habitat type is not restrained by distance they would need to travel.
#The value for either space or habitat alone does not say anything about whether they can act independently on one another.
#How do you know Diptera have the strongest flight ability? You didn't use your results to compare them...

#Part 3: For each of your chosen groups of bugs, perform variable selection for the habitat data rather than the AEM data.
  # Definitions for the habitat column names:
    #Inorg = total suspended inorganic solids in the water column
    #Organ = total suspended organic solids in the water column
    #Chla = Chlorophyll a concentration from benthic rocks collected in-stream
    #BOM = total benthic organic matter in the sample
    #Depth = water depth
    #Flow	= water velocity where samples were collected
    #Fines = Percent of the substrate as "fines" i.e. small particles too small to measure
    #AveAr = The average size of rocks where each sample was collected


Clingers.rda <- rda(Clingers.mat, as.data.frame(HabitatbyPatch.mat))
Clingers.r2a <- RsquareAdj(Clingers.rda)$adj.r.squared

aem.fwd <- forward.sel(Clingers.mat,HabitatbyPatch.mat, adjR2thresh=Space.r2a)
aem.fwd

Diptera.rda <- rda(Diptera.mat, as.data.frame(HabitatbyPatch.mat))
Diptera.r2a <- RsquareAdj(Diptera.rda)$adj.r.squared

aem.fwd <- forward.sel(Diptera.mat,HabitatbyPatch.mat, adjR2thresh=Space.r2a)
aem.fwd

#Which habitat variables are significant for each? (10 points)

For Clingers, the variable of Depth has a significant p value of 0.001. For Diptera, Chla, Depth, Flow, Average Ar, and Inorg has significant p values of 0.007, 0.005, 0.012, 0.022, and 0.043. Diptera had more significant variables than Clingers


#Part 4: How do you expect selecting both the spatial and the habitat variables would change the results of the RDAs from Part 1 above? (5 points)
  #(You do not need to redo the RDAs, unless you *want* to.)


Selecting both spacial and habitat variables would increase the significance of habitat because relationships with habitats vary with the significance of space that controls spacial relationships.


#This might be true, but it's tangential to the question. Without selecting variables for habitat, you are likely overfitting that part of the model.
#So the "real" influence of space is likely much stronger than what you generated with the above models.