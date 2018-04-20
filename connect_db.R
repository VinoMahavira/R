library(DBI)
# Connect to my-db as defined in ~/.my.cnf
con <- dbConnect(RMySQL::MySQL(),user='root',password='root',dbname='travlr_auth', host='127.0.0.1',port=8889)

dbListTables(con)

dbListFields(con, "users")
res <- dbSendQuery(con, "SELECT user_email FROM users limit 5")
dbFetch(res)

# Or a chunk at a time
while(!dbHasCompleted(res)){
  chunk <- dbFetch(res, n = 3)
  print(nrow(chunk))
}

# Clear the result
dbClearResult(res)

