# First, recreate Figure 4 from Herron et al. (2019). De novo origins of multicellularity in response to predation. Scientific Reports.
  # Search datadryad.org by the paper title and download the dataset. It will include .csv files and R scripts, organized by figure.
  # Save the script and change the working directory on lines 8 and 115 to match your GitHub repository. (6 points)

### Script to  analyze chlamy timelapse data ###

library(ggplot2)
library(dplyr)
library(reshape2)


  # Export and save the plot you've created. (2 points)
  # Zoom into your plot to look at the distribution for different strains.

# Do all of the strains in the plot have the same distributions (yes/no)? (2 pt)
No, they have different ranges of distributions. K101-B210 have similar distributions, but with varying densities, while B505-B204 have increasingly spread apart distributions and smaller sample sizes.

# Based on these observations of your strain distributions, why did the authors use a Kruskal-Wallis test rather than ANOVA to compare the strains? (2 pts)

The authors used a Kruskal-Wallis test because the distribution of data is widely distributed/abnormal, thus it is more useful for analyzing the data because ANOVA assumes a similar-ranged, normal distribution of data.
#What does K-W assume by comparison.

# Use the fitdist() and gofstat() functions to compare the poisson, negative binomial, and logistic distributions for:
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)

fit.logis1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)), distr = "logis")
fit.pois1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)), distr = "pois")
fit.nbinom1 <- fitdist(c (na.exclude (data$Num.Cells.Progeny)), distr = "nbinom")

gofstat(list(fit.logis1, fit.pois1, fit.nbinom1), chisqbreaks=c(1,2,4,8,16,32,64))

  # (2) - The replication time (data$RepTime.sec)
      # 3 points each
fit.logis2 <- fitdist(c (na.exclude (data$RepTime.sec)), distr = "logis")
fit.pois2 <- fitdist(c (na.exclude (data$RepTime.sec)), distr = "pois")
fit.nbinom2 <- fitdist(c (na.exclude (data$RepTime.sec)), distr = "nbinom")

gofstat(list(fit.logis2, fit.pois2, fit.nbinom2), chisqbreaks=c(1,2,4,8,16,32,64))

    #HINT- "Num.Cells.Progeny" has defined breaks. To display results, use the formula with the "chisqbreaks" argument as follows:
      #gofstat(list(fit.1, fit.2, fit.3, etc), chisqbreaks=c(1,2,4,8,16,32,64))

# Based on the AIC scores, which distribution is the best fit for: (4 pts)
  # (1) - The number of cells of progeny (data$Num.Cells.Progeny)?
  # (2) - The replication time (data$RepTime.sec)?

The binomial duistribution that is the least positive serves as the best fit because those AIC numbers are the lowest
#negative binomial

# Plot a generic histogram for the replication time (data$RepTime.sec) (2 pt)

hist(data$RepTime.sec)

# Based on the patterns of this histograms and Figure 4:
  #Give one hypothesis for an evolutionary process represented by the two tallest bars in your histogram. (6 pts)

It can be hypothesised that the 2 tallest bars represent r selected species, such as insects, as opposed to the lower bars, which would represent k species, such as large mammals. R species are smaller than k species, but focus more heavily on reproduction and producing offspring because they are much shorter lived than k species.
#This doesn't make much sense given what the data represent. IF these were populations of different species, then it would make sense.
  # Don't cheat by looking at the paper! 
    # This hypothesis does not need to be correct - it only needs to be ecologically rational based these two figures.








