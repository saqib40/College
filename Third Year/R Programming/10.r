# Experiment the steps to connect with a data source and choose between 
# live connection and extract.

install.packages("DBI")       # Database Interface (generic functions)
install.packages("RSQLite")   # SQLite backend

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
