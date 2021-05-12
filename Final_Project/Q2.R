# A. Logistics Regression because we are examining the association independent variables with one dichotomous dependent variable. The dependent variable is not continuous therefore we cannot use linear regression


df_q2 = read.csv(choose.files())
df_q2

#B.
color <- ifelse(df_q2$Ownership=='Owner', "red", "blue")
type <- ifelse(df_q2$Ownership=='Owner', 19, 15)
plot(df_q2$Income,df_q2$Lot_Size, col = color, pch = type, xlab = "Income", ylab = "Lot Size", main = "Income v. Lot Size")
legend("bottomright",c("Owner", "Non-Owner"), pch = c(19,15),col = c("red", "blue"))
#Looking at the plot you can see that owners have a higher avg. income 



#C.
Log_Reg <- glm(Ownership ~ Lot_Size + Income, data = df_q2, family = binomial(link='logit') )
summary(Log_Reg)


Log_Prob <- data.frame(Lot_Size = 25, Income = 50 )

predict_log <- predict(Log_Reg, Log_Prob, type = "response")
#Probability Income = 50000, LOt Size = 25000 is an owner 
predict_log

