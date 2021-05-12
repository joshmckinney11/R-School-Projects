carfile <- file.choose()
CarPfunction <- function(){
  carP<- read.table(file=carfile, header = TRUE, sep = ",")
  carP1<- data.frame()
  for(x in 1:length(carP$cty)){
    if(carP[x,8]>=20){
      carP1 <-rbind(carP1,carP[x,])
    }
  }
  carPtxt <- carP1[,c("manufacturer","model","cty")]
write.table(carPtxt,"CarPSubset.txt",row.names =FALSE, col.names = TRUE, sep='\t')

}
CarPfunction()



library(dplyr)
carP2<- read.table(file=carfile, header = TRUE, sep = ",")
carP2 %>%
  group_by(model) %>%
  summarize(AvgCityMPG=mean(cty), AvgHighwayMPG=mean(hwy))



#created mode function to help summarize easier
Mode <- function(x) {
  ux <- unique(x)
  ux[which.max(tabulate(match(x, ux)))]
}
carP2 %>%
  group_by(Make=manufacturer)%>%
  summarize(MostFrequentCylinders=Mode(cyl))
  
  
