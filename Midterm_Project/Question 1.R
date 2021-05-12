
airQname <- file.choose() #saved excel file as CSV and chose from my folder
airQ <- read.table(file=airQname, header = TRUE, sep = ",", na.strings = "*")
head(airQ)



library(dplyr)
WindSort<- arrange(airQ,Wind)
head(WindSort)



Plot1 <- airQ[,c("Ozone","Temp","Month")]    #creating data frame with only columns needed
Plot2 <- data.frame()
i=1
#creating new data frame without any NA's or temp<60
while(i <= nrow(Plot1)){
  if(Plot1[i,1]=="NA"|| Plot1[i,2]<60 ){
    i=i+1
    
  }
  else{
    x=Plot1[i,]
    Plot2 <- rbind(Plot2,x )
    i=i+1
  }
}
x<-Plot2[,1]
y<-Plot2[,2]
z<-Plot2[,3]
#plotting points and lableing plots
plot(x,y,xlab="Temp",ylab="Ozone", main="Temp to Ozone for months May-September")
points(x[z==5],y[z==5], pch=20,col="red")
points(x[z==6],y[z==6], pch=20,col="blue")
points(x[z==7],y[z==7], pch=20,col="green")
points(x[z==8],y[z==8], pch=20,col="pink")
points(x[z==9],y[z==9], pch=20,col="yellow")
legend("bottomright",c("May","June","July","August","September"), pch = (20),col = c("red", "blue","green","pink","yellow"))


newTable <- airQ[,c("Solar.R","Month","Day")]
newTable1<- data.frame()
for(x in 1:length(airQ$Month)){
  if(newTable[x,2]==6 ||newTable[x,2]==7){
    z=newTable[x,]
    newTable1<- rbind(newTable1,z)
  }
}
dput(x=newTable1,file="Solar.txt")


