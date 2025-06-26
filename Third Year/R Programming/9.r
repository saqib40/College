# Perform Pearson correlation testing in R using different methods

# Step 1: Create two numeric vectors of equal length
x <- c(1, 2, 3, 4, 5, 6, 7)
y <- c(1, 3, 6, 2, 7, 4, 5)

# --- Method 1: Using cor() ---
# Computes the Pearson correlation coefficient only (no test)
result1 <- cor(x, y, method = "pearson")

# Print just the correlation value
cat("Pearson correlation coefficient (using cor) is:", result1, "\n")

# --- Method 2: Using cor.test() ---
# Performs Pearson correlation test with hypothesis testing
result2 <- cor.test(x, y, method = "pearson")

# Print full statistical test result
print(result2)
