require(sqldf)
data = read.csv("cleandata.csv", header=TRUE)
x = sqldf("
           SELECT 
             SUBSTR(trapType,-2,2) AS lure,
             mg/days AS rr 
           FROM data
           WHERE 
             trapType LIKE '%L' 
             AND lureNote <> 'rr unreliable'
             AND mg <> 'NA'
           ")
t.test(rr~lure, x)
boxplot(rr~lure, x, ylab = 'mg per day')