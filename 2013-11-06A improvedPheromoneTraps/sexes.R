require(sqldf)
data = read.csv("cleandata.csv", header=TRUE)
x = sqldf("
          SELECT
            SUM(maleCRB) AS m, SUM(femaleCRB) AS f
          FROM data
          WHERE 
            trapType LIKE '%L' 
          ")
x
binom.test(c(x$m, x$f), 0.5)