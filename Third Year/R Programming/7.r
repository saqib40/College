# Create a model for mtcars dataset, 
# First use aov() to run the model, then  use summary() to print the summary of the model.

# Step 1: Install and load the dplyr package
install.packages("dplyr")  # Only run this once
library(dplyr)

# Step 2: Print the top 5 rows of the mtcars dataset
head(mtcars, 5)  # Displaying 5 rows to understand the structure

# Step 3: Perform ANOVA using aov()
# Here we are checking if the mean displacement (disp) is significantly different across different gear groups
mtcars_aov <- aov(mtcars$disp ~ factor(mtcars$gear))

# Step 4: Show the ANOVA summary
summary(mtcars_aov)
