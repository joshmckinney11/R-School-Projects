df = read.csv(choose.files())
df_test <- df[c('Price','Car_Age','Odometer','Fuel_Type','HP','Automatic','Doors','Qtr_Tax','Build_Guarantee','Guarantee_Months','Cold_Air','Cold_Air_Auto', 'CD_Player', 'Powered_Windows', 'Sports','Towing')]


SelVars <- c(1:16)

set.seed(1)

Partition_Data <- sample(seq(1,3),size = nrow(df_test),replace=TRUE, prob = c(.5,.3,.2))
Training_Df <- df_test[Partition_Data==1,]
Validation_Df <- df_test[Partition_Data==2,]
Test_Df <- df_test[Partition_Data==3,]

Car_Results <- lm(Price ~ ., data = Training_Df)


options(scipen=999)
summary(Car_Results)

#The three best predictors are Car_Age, Odometer, and Cold_Air_Auto due to them having the smallest p-values
#meaning they are most significant to predicting price


#Re-running model with three best predictors 
Partition_Data2 <- sample(seq(1,3),size = nrow(df_test),replace=TRUE, prob = c(.5,.3,.2))
Training_Df2 <- df_test[Partition_Data==1,c(1,2,3,12)]
Validation_Df2 <- df_test[Partition_Data==2,c(1,2,3,12)]
Test_Df2 <- df_test[Partition_Data==3,c(1,2,3,12)]

Car_Results2 <- lm(Price ~ ., data = Training_Df2)


options(scipen=999)
summary(Car_Results2)

library(forecast)
#Predicting prices of cars using validation set, based on model 
Car_Pred <- predict(Car_Results2, Validation_Df2)
Car_Pred


#COmputing difference in predicted price and actual price of validation 
Some_Residuals <- Validation_Df2$Price[1:20] - Car_Pred[1:20]
data.frame("Predicted" = Car_Pred[1:20], "Actual" = Validation_Df2$Price[1:20], "Residual" = Some_Residuals)
