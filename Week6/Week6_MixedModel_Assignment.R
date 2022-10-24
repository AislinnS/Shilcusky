# Read in the "Toscano_Griffen_Data.csv" data from GitHub and load the three packages we used in the tutorial this week.
# The paper these data came from is uploaded to Canvas as "Toscano&Griffen_2014_JAE..."

df <- read.csv("Toscano_Griffen_Data.csv")

library(MASS)
library(MuMIn)
library(mgcv)

# First create models with the same (y) and method (GLMM) as the published paper, using the GLMM function from the tutorial. 

glmm.mod1 <- glmmPQL(prop.cons~activity.level+claw.width+temperature+toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = df)
r.squaredGLMM(glmm.mod1)
plot(glmm.mod1)
#This model doesn't work until you run line 34 below. We talked about this and moving things in the problem session...
  #Create two different models using the same 3 predictor (x) variables from the dataset. (4 points each) 
    # In one model only include additive effects.

glmm.mod2 <- glmmPQL(prop.cons~activity.level+claw.width+temperature+toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = df)
r.squaredGLMM(glmm.mod2)
plot(glmm.mod2)

    # In the other model include one interactive effect.

glmm.mod3 <- glmmPQL(prop.cons~activity.level+claw.width+temperature*toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = df)
plot(glmm.mod3)
r.squaredGLMM(glmm.mod3)

    # Use a binomial distribution and block as a random effect in both models to match the paper's analyses. Remember ?family to find distribution names.

# The authors used proportional consumption of prey as the (y) in their model, but did not include this in the dataset.
  # So we are going to create it - run the following line, assuming df= your data frame (feel free to change that):

df$prop.cons <- df$eaten/df$prey

# (Q1) - The code in line 8 is performing two operations at once. What are they? (2 pts)

Since it is showing the comparison between eaten versus prey, it is naming it prop.cons to reflect so while also adding another column to the data frame.

# (Q2) - Did the interactive effect change which variables predict proportional consumption? How, specifically, did the results change? (5 pts)

This interactive effect changed the outcomes of the variables examined since toadfish.cue.treatment was multiplied instead of added as it tested the oredictors individually.
#Question is about the results of the model. Fewer variables are significant with interactive effects.

summary(glmm.mod2)
summary(glmm.mod3)


# (Q3) - Plot the residuals of both models. Do you think either model is a good fit? Why or why not? (3 pts)

THe residuals show a clear pattern, therefore thy cannot be deemed a good fit. Neither is a good fit because the are linear as a non-linear model may end up being a better fit.
#What does the second half of your answer mean?

# Re-run both models as generalized additive models instead (using gam). Then compare the AIC of both models. (4 points each)

gam.mod1 <- glmmPQL(prop.cons~activity.level+claw.width+temperature+toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = df)
r.squaredGLMM(gam.mod1)
plot(gam.mod1)

gam.mod2 <- glmmPQL(prop.cons~activity.level+claw.width+temperature*toadfish.cue.treatment, family = binomial, random = ~ 1 | block, data = df)
plot(gam.mod2)
r.squaredGLMM(gam.mod2)

AIC(gam.mod1, gam.mod2) 
#Neither of these models is correct. They are the exact same glmm models with the object named "gam", which does not change the model at all.

# (Q4) - Which model is a better fit? (2 pt)

gam.mod1 has a lower AIC value, which is a better fit bceuase it uses less parameters.
#Neither mode has an AIC value to compare.

# (Q5) - Based on the residuals of your generalized additive models, how confident are you in these results? (2 pts)

I am confident in the accuracy of the interactive model more than the additive model because the intercative model has a cleaner, closer fit than the additive model which has residuals in more of a biased pattern.
#From running your code, the residual patterns are identical and your answer does not reflect that.
