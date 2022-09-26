# Look at the plot and model results for our Dryad data in the tutorial. Part 1: Without knowing which points represent which groups, 
  # give one explanation for why these data might be difficult to draw spatial inferences about genes.(3 points)

The plot generates the same data with a random perspective upon each generation, therefore it does not provide one correct interpretation of spacial distance. There is no way to infer the true spacial inferences. This is more of a flowchart that shows corrolation and direct lineages.

  # Part 2: Despite the drawbacks, give the result or interpretation that you feel most confident in (3 points), and EXPLAIN WHY (4 points).

Both seq16 and seq5 are both equal distance, 10 dots, from seq24. Each of those seq have the same distance apart

# For your scripting assignment we will use the "ge_data" data frame found in the "stability" package.
  # Install the "stability" package, load it into your R environment, and use the data() function to load the "ge_data". (2 points)

install.packages ('stability')
library('stability')
data('ge_data')


# Create two linear models for Yield Response: one related to the Environment and one to the Genotype. (2 points each)

plot('ge_data')
head('ge_data')

  # 'Yield Response' in this dataset is a measure of phenotype expression.
  # Hint: Look at the help file for this dataset.

# Test the significance of both models and look at the model summary. (3 points each)
  # Which model is a better fit to explain the yield response, and WHY? (6 points)
  # Hint: Does one model seem more likely to be over-fitted?

# Which environment would be your very WORST choice for generating a strong yield response? (2 points)
