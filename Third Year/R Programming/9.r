# Perform Pearson correlation testing in R using different methods

x <- c(1, 2, 3, 4, 5, 6, 7)
y <- c(1, 3, 6, 2, 7, 4, 5)

result1 <- cor(x, y, method = "pearson")

cat("Pearson correlation coefficient (using cor) is:", result1, "\n")

result2 <- cor.test(x, y, method = "pearson")

print(result2)
