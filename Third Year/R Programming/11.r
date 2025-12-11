# Experiment the steps to connect with a data source and choose between 
# live connection and extract using CSV File

filepath <- file.path("C:/Users/student/Downloads/annual-enterprise-survey-2023-financial-year-provisional.csv")

data <- read.csv(filepath)

csv_data <- data

summary(csv_data)
