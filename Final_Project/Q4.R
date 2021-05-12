library(arules)


data <- choose.files()
df_q4 <- read.csv(data, header = TRUE)

rules <- apriori(data=df_q4,parameter = list(supp=.005, conf = 0.15, minlen =3))
#total of 103 rules


#FInding top rules 
rules_lift <- sort(rules, by="lift", decreasing = TRUE)
inspect(head(rules_lift))
#If someone purchases citrus fruit, shopping bags, and margarine, they will more than likely buy semi finished bread as well