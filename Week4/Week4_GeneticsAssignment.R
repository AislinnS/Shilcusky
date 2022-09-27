# Look at the plot and model results for our Dryad data in the tutorial. Part 1: Without knowing which points represent which groups, 
  # give one explanation for why these data might be difficult to draw spatial inferences about genes.(3 points)

The plot generates the same data with a random perspective upon each generation, therefore it does not provide one correct interpretation of spacial distance. There is no way to infer the true spacial inferences or how far apart things truly are in place of the representative dots. This is more of a flowchart that shows corrolation and direct lineages.

  # Part 2: Despite the drawbacks, give the result or interpretation that you feel most confident in (3 points), and EXPLAIN WHY (4 points).

Both seq16 and seq5 are both equal distance, 10 dots, from seq24. Each of those seq have the same distance apart

# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.
  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". (2 points)

install.packages ('stability')
library('stability')
data('ge_data')

# Create two linear models for Yield Response: one related to the Environment and one to the Genotype. (2 points each)

Spider <-lm(ge_data$Yield ~ ge_data$Env)

Spooder <-lm(ge_data$Yield ~ ge_data$Gen)

  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.

# Test the significance of both models and look at the model summary. (3 points each)

anova(Spider)
anova(Spooder)

summary (Spider)
summary (Spooder)

  # Which model is a better fit to explain the yield response, and WHY? (6 points)

The ge_data$Env model is the best fit because it has a higher r-squared value compared to ge_data$Gen model. The lower the r-value, the lower the signifigance is in terms of the relationship.  shows the difference between sample means,indicating a lower variation between the genetic model than the environment model. An r-value of 1 is perfect while an r-value of 0 is not ideal, therefore the r-value of Env, 0.4359 is much better than that of Gen, 0.1183

  # Hint: Does one model seem more likely to be over-fitted?

# Which environment would be your very WORST choice for generating a strong yield response? (2 points)

The Sargodha environment, from the Pr of f, has a p-value of 0.7138, which is significantly higher than the rest. The higher the p-value is, the more variation there is between points.
