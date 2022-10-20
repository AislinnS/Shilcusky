# Load the "anytime" and "ggplot2" packages to complete this week's assignment.
# Read the "Plankton_move_average" CSV in from GitHub. 

df <- read.csv("Plankton_move_average.csv")
View(Plankton_move_average)

# These are data from the Great Lakes Environmental Research Laboratory plankton sampling.


#Used the following lines to format the date and remove NAs from the dataset:
df$Date <- as.Date(df$Date, origin = 0001-01-01) # Setting values to "day zero".
df <- na.omit(df)



#Plot these population data over time with the following code:
ggplot(df)  +
  xlab("Numeric Date") + ylab("Density Individuals")+
  geom_line(data=df, aes(Date, D.mendotae), color="black", alpha = 0.7, size=1)+
  geom_line(data=df, aes(Date, LimncalanusF+LimncalanusM), color="orange",  alpha = 0.7, size=1)+ # adding males and females together, hint: this is actually spelled Limnocalanus
  geom_line(data=df, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  geom_line(data=df, aes(Date, Bythotrephes), color="sky blue",  alpha = 0.7, size=1)+
  theme_bw() 


# Export this plot to have on hand for reference in the next section of the assignment (and upload with your script).

# (1) - Which species is most likely to be r-selected prey and which its primary predator? (2 pts)

D. mendotae is most likely to be r-selected prey and its primary predator would be Limnocalanus.

# What is one relationship the third species MIGHT have to the first two? (2 pts)

It may serve as a confounding variable that affects the relationship between the first two species, it could be parasitic to one of the first two species.

#Now copy/paste in the Lotka-Volterra function, plotting script, and load the "deSolve" package from the tutorial:

LotVmod <- function (Time, State, Pars) {
  with(as.list(c(State, Pars)), {
    dx = x*(alpha - beta*y)
    dy = -y*(gamma - delta*x)
    return(list(c(dx, dy)))
  })
}

Pars <- c(alpha = 2, beta = 0.5, gamma = .2, delta = .6) #This is the line we will change
State <- c(x = 10, y = 10)#For now keep this the same.
Time <- seq(0, 100, by = 1)#For now keep this the same.
out <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))

matplot(out[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)


library(deSolve)


# (2) - What do alpha, beta, gamma, and delta represent in this function? (4 pts)

Alpha represents how well Limncalanus competes with D.mendotae (prey population growth). Beta represents how well D.mendotae competes with Limcalanus (population stability). Delta represents the rate of Limncalanus consumption (die off rate).

# (3) - By only changing values for alpha, beta, gamma, and/or delta
# change the default parameters of the L-V model to best approximate the relationship between Limncalanus and D.mendotae, assuming both plots are on the same time scale.


Pars <- c(alpha = 3.7, beta = 0.2, gamma = .2, delta = .6)
df <- as.data.frame(ode(func = LotVmod, y = State, parms = Pars, times = Time))

matplot(df[,-1], type = "l", xlab = "time", ylab = "population")
legend("topright", c("Limncalanus", "D.mendotae"), lty = c(1,2), col = c(1,2), box.lwd = 0)


# What are the changes you've made to alpha, beta, gamma, and delta from the default values; and what do they say in a relative sense about the plankton data? (4 pts)

I increased the alpha value and decreased the beta value. This shows that both species are interconnected and that plankton communities are easily succeptable to changes in rates of predation in relation to stability of a population

# Are there other paramenter changes that could have created the same end result? (2 pts)

Yes, the environment that both species exist in could create a different predator-prey dynamic with a more or less expedited growth rate.

# Export your final L-V plot with a legend that includes the appropriate genus and/or species name as if the model results were the real plankton data, 
# and upload with your script. (hint - remember which one is the predator and which is the prey)


