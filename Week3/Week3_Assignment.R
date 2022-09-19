# (1) Approximately how many hours ahead of Sunbury was the peak flow in Lewisburg during the 2011 flood? (2 pt)
  
About 9 hours, but around 7-11 hours

# (2) Give one reason why information on the time between peak flow events up- and downstream could be valuable? (4 pts)

It could be useful to implement emergency flood prevention mechanisms to delay flood times

# Package scavenger hunt! (12 pts each)

## (3) Using Google and ONLY packages from GitHub or CRAN:
    # Find a package that contains at least one function specifically designed to measure genetic drift.
    # Copy-paste into your script - and run - an example from the reference manual for a function within this package related to a measure of genetic drift. 

install.packages("HardyWeinberg")
library(HardyWeinberg)


n <- 40 # sample size
m <- 100 # number of markers
Xc <- HWClo(HWData(n,m))
HWGenotypePlot(Xc,plottype=1,main="Heterozygote-homozygote scatterplot")
# }

        # Depending on the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
    # After running the function example, manipulate a parameter within the function to create a new result. 
        # Common options might be allele frequency, population size, fitness level, etc. 
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
       
          # By manipulating these parameters you can see how it impacts the results.
          # This type of manipulation is one example of how theoretical ecology and modelling are used to predict patterns in nature.



## (4) Using Google and ONLY packages from GitHub or CRAN:
    # Find a package that will generate standard diversity metrics for community ecology, specifically Simpson's Diversity Index.
    # Copy-paste into your script - and run - an example from the reference manual for a function to calculate Simpson's diversity. 

install.packages("vegan")
library(vegan)

op <- par(mar=c(4,4,8,8)+0.2, mfrow=c(2,2))
data(BCI)
dis <- vegdist(BCI)
tr <- spantree(dis)
pl <- ordiplot(cmdscale(dis), main="cmdscale")
lines(tr, pl, col="red")
ord <- isomap(dis, k=3)
ord
pl <- plot(ord, main="isomap k=3")
lines(tr, pl, col="red")
pl <- plot(isomap(dis, k=56), main="isomap k=5")
lines(tr, pl, col="red")
pl <- plot(isomap(dis, epsilon=0.45), main="isomap epsilon=0.45")
lines(tr, pl, col="green")
par(op)
## colour points and web by the dominant species
dom <- apply(BCI, 1, which.max)
## need nine colours, but default palette  has only eight
op <- palette(c(palette("default"), "sienna"))
plot(ord, pch = 16, col = dom, n.col = dom) 
palette(op)


        # Depending on the example usage of the function, either upload a plot of the result or use print() and copy/paste the console output into your script.
    # After running the function example, modify your script to generate another diversity metric that is NOT part of the example. 
        # If there are two diversity metrics in the example script, neither of these will count as the modified script.
        # Hint: If the function can "only" caluclate Simpson's diversity, the inverse of Simpson's diversity is another common metric. 
        # Add the results of this manipulation to your script (if in the console) or upload the new plot.
        
          # Diversity metrics are frequently used in community ecology for reasons ranging from a quick comparison between sites to understanding community stability.
          # Their calculation can be very tedious by hand - and very fast with a package designed for the operation.



