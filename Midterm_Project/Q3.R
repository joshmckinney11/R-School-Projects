#created a function for the problem for easier debug
Change_Function <- function(){
  #Defining variables used in function 
  y<- FALSE        
  z<- FALSE
  dollar <- 0
  quarter <- 0
  dime <- 0
  nickel <- 0
  n <-round(runif(1,min=1,max=90), digits=2)#random dollar amount generated
  
  #displaying total and asking for payment amount
  print(paste("Your total is $", n))
  usertotal <- readline(prompt = "Enter dollar amount:")
  usertotal <- as.double(usertotal) 
  
  
  #error checking to make sure payment is larger than amount due and no greater than 100
  while(y==FALSE){
    if (usertotal<n || usertotal > 100){
      usertotal <- readline(prompt ="Error, enter amount more than total and no greater than $100:")
      usertotal <- as.double(usertotal)
      y<-FALSE
    }
    else{
      y<-TRUE
    }
  }
  
  
  #calculating amount to be given as change 
  Change <- usertotal - n
  Change1<- Change
  
  
  #calculating the amount of each denomination needed
  while(z==FALSE){
    if(Change>=1){
      Change<- Change-1
      dollar <- dollar +1
      z<-FALSE
    }
    else if(Change>=0.25){
      Change<-Change-0.25
      quarter<- quarter +1
      z<-FALSE
    }
    else if (Change>=0.1){
      Change <- Change-.1
      dime <- dime +1
      z<-FALSE
    }
    else if (Change>=.01){
      Change<- Change-.05
      nickel <- nickel+1
      z<-FALSE
    }
    else if (Change<=0){
      z<-TRUE
    }
  }
  
  
  #putting denomination totals into a data frame to be outputted
  totalcoins<-c(dollar,quarter,dime,nickel)
  denomination<-c("Dollars:","Quarters:","Dimes:","Nickels:")
  totalchange <- data.frame(Denomination=denomination, Count=totalcoins)
  
  #outputting data
  print(paste("Your total change is: $",sep = "", Change1))
  print(totalchange)
}



Change_Function()
