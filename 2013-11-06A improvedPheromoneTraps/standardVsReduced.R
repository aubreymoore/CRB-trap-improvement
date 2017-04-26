require(sqldf)
data = read.csv("cleandata.csv", header=TRUE)
x = sqldf("
          SELECT
          trapType,
          CHARINDEX('S',trapType, 0)>0 AS S,
          1.0*(maleCRB + femaleCRB)/days AS trapRate
          FROM data
          WHERE 
          trapType LIKE '%L' 
          ")
t.test(trapRate~S, x)
boxplot(trapRate~S, x, ylab = 'beetles trapped per day')