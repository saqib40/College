# Print label for the output
cat("Prime Numbers:")

# Loop through numbers from 1 to 10
for(i in 1:10) {
  prime <- TRUE  # Assume the number is prime initially
  # Check divisibility from 2 to square root of i
  for(j in 2:sqrt(i)) {
    if(i %% j == 0) {  # If i is divisible by j (i.e., not prime)
      prime <- FALSE   # Mark as not prime
      break            # Exit the loop early
    }
  }
  # If still marked as prime, print the number
  if(prime)
    cat(i, " ")
}
