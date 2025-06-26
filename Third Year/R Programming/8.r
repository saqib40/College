# Fit a simple linear regression model using the lm() function.

# Step 1: Create a sample dataset with x and y values
df <- data.frame(
  x = c(1, 2, 3, 4, 5), 
  y = c(1, 5, 8, 15, 26)
)

# Step 2: Fit a linear regression model
# Note: 'x^2' inside the formula will be treated as 'x' unless I() is used.
# So this is modeling y ~ x^2, using x as the predictor, but x^2 is computed automatically
linear_model <- lm(y ~ I(x^2), data = df)

# Step 3: View the model summary
summary(linear_model)
