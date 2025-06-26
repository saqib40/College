# Store a string
str1 <- "Data Analytics with R Programming"

# Create a numeric vector with some duplicate values
x <- c(12, 9, 11, 15, 9, 11)

# Print the original string
cat("Original string is :", str1, "\n")

# Convert and print the string in uppercase
cat("String in Upper case:", toupper(str1), "\n")

# Convert and print the string in lowercase
cat("String in Lower case :", tolower(str1), "\n")

# Print the original vector
cat("Original Vector is :", x, "\n")

# Print only the unique elements of the vector
cat("Unique Numbers of Vector are :", unique(x), "\n")
