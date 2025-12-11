# Create a model for mtcars dataset, 
# First use aov() to run the model, then  use summary() to print the summary of the model.

install.packages("dplyr")
library(dplyr)

head(mtcars, 5)

mtcars_aov <- aov(mtcars$disp ~ factor(mtcars$gear))

summary(mtcars_aov)
