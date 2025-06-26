# Two Categorical Variables – Discover relationships within a dataset

# Load the MASS library which contains the 'survey' dataset
library(MASS)

# Display the structure of the dataset to understand the types of variables
print(str(survey))

# Create a contingency table between 'Smoke' (Smoking habit) and 'Exer' (Exercise habit)
# This cross-tabulates the counts of students for each combination of smoking and exercise habits
stu_data <- table(survey$Smoke, survey$Exer)

# Print the contingency table
print(stu_data)

# Perform a Chi-Square Test of Independence on the table
# This checks if there is a significant relationship between smoking and exercise habits
chi_result <- chisq.test(stu_data)

# Print the results of the Chi-Square test (including p-value and expected counts)
print(chi_result)