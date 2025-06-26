# Initialize the first two Fibonacci numbers
x <- 0  # First number in the Fibonacci sequence
y <- 1  # Second number in the Fibonacci sequence

# Print a label for the output
cat("Fibonacci Sequence:")

# Loop to print the first 10 Fibonacci numbers
for(i in 1:10) {
  
  cat(x, " ")  # Print the current Fibonacci number
  
  z <- x + y   # Calculate the next number in the sequence
  x <- y       # Update x to the next number in sequence
  y <- z       # Update y to the next number in sequence
}
