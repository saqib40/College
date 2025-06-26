# Experiment the steps to connect with a data source and choose between 
# live connection and extract.


# Step 1: Install required packages (run only once)
install.packages("DBI")       # Database Interface (generic functions)
install.packages("RSQLite")   # SQLite backend
# install.packages("RODBC")     # For other DBs, not used here
# install.packages("odbc")      # Also for general DB connection

library(RSQLite)
library(DBI)
con <- dbConnect(RSQLite :: SQLite(),dbname="mydata.db")
dbExecute(con,"CREATE TABLE STUDENT123(
          ID INTEGER PRIMARY KEY,
          NAME TEXT,
          AGE INTEGER,
          GRADE TEXT
) ")
dbExecute(con,"INSERT INTO STUDENT123(NAME ,AGE ,GRADE)
          VALUES ('GINNY',21,'A'),
          ('HAMZA',23,'C')
          ")

extract <-dbGetQuery(con,"SELECT * FROM STUDENT123 WHERE  GRADE='A'")
print(extract)
result <-dbReadTable(con,'STUDENT123')
print(result)
