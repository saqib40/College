# Fit a simple linear regression model using the lm() function.

df <- data.frame(
  x = c(1, 2, 3, 4, 5), 
  y = c(1, 5, 8, 15, 26)
)

linear_model <- lm(y ~ I(x^2), data = df)

summary(linear_model)
