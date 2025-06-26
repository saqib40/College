# Create Two Dimensional Tables from Multi-Dimensional

# Create a sample dataset with 3 categorical variables:
# Gender, AgeGroup, and EmploymentStatus
data <- data.frame(
  Gender = c("Male", "Male", "Female", "Female", "Male", "Female"),
  AgeGroup = c("18-30", "31-40", "41-50", "18-30", "31-40", "41-50"),
  EmploymentStatus = c("Employed", "Unemployed", "Employed", "Employed", "Unemployed", "Unemployed"),
  stringsAsFactors = FALSE
)

# Perform a 3-dimensional cross-tabulation:
# This creates a frequency count of all combinations of Gender, AgeGroup, and EmploymentStatus
cross_tab <- table(data$Gender, data$AgeGroup, data$EmploymentStatus)

# Print the full 3D cross-tabulated table
print(cross_tab)

# Extract a 2D table for Gender vs EmploymentStatus
# Here, dimensions 1 (Gender) and 3 (EmploymentStatus) are retained
gender_vs_employment <- margin.table(cross_tab, c(1, 3))
print(gender_vs_employment)

# Extract a 2D table for AgeGroup vs EmploymentStatus
# Here, dimensions 2 (AgeGroup) and 3 (EmploymentStatus) are retained
age_vs_employment <- margin.table(cross_tab, c(2, 3))
print(age_vs_employment)
