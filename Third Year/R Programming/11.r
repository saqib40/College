# Experiment the steps to connect with a data source and choose between 
# live connection and extract using CSV File

# Step 3: Define the file path
filepath <- file.path("C:/Users/student/Downloads/annual-enterprise-survey-2023-financial-year-provisional.csv")

# Step 4: LIVE READ - Simulate live connection by reading directly each time you need fresh data
data <- read.csv(filepath)  # Reads the CSV file at runtime (like querying live)

# Step 5: EXTRACT - Store the data into another variable for local manipulation
csv_data <- data  # This acts as your extracted/snapshot data

# Step 6: Show summary of the data
summary(csv_data)
