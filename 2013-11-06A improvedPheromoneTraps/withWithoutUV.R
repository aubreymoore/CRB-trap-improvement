require(sqldf)
data = read.csv("cleandata.csv", header=TRUE)
x = sqldf("
          SELECT
            trapType,
            CHARINDEX('U',trapType, 0)>0 AS UV,
            1.0*(maleCRB + femaleCRB)/days AS trapRate
          FROM data
          WHERE 
            trapType LIKE '%L' 
          ")
t.test(trapRate~UV, x)
boxplot(trapRate~UV, x, ylab = 'beetles trapped per day')