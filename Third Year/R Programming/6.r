# Create Two Dimensional Tables from Multi-Dimensional

data <- data.frame(
  Gender = c("Male", "Male", "Female", "Female", "Male", "Female"),
  AgeGroup = c("18-30", "31-40", "41-50", "18-30", "31-40", "41-50"),
  EmploymentStatus = c("Employed", "Unemployed", "Employed", "Employed", "Unemployed", "Unemployed"),
  stringsAsFactors = FALSE
)

cross_tab <- table(data$Gender, data$AgeGroup, data$EmploymentStatus)
print(cross_tab)

gender_vs_employment <- margin.table(cross_tab, c(1, 3))
print(gender_vs_employment)

age_vs_employment <- margin.table(cross_tab, c(2, 3))
print(age_vs_employment)
