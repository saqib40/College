# Two Categorical Variables – Discover relationships within a dataset

library(MASS)
print(str(survey))
stu_data <- table(survey$Smoke, survey$Exer)
print(stu_data)
chi_result <- chisq.test(stu_data)
print(chi_result)
