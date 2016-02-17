pollutantmean <-function(directory, pollutant, id=1:332) {
  #pollutantmean("specdata", "sulfate", 1:10)
  # [1] 4.064
  #pollutantmean("specdata", "nitrate", 70:72)
  # [1] 1.706
  #pollutantmean("specdata", "nitrate", 23)
  # [1] 1.281

  j<-1
  for (i in id){
    #We need to format the filename to be opened accordingly
    if(i<10){filename<-paste("00",i,sep="")}
    else if (i<100){filename<-paste("0",i,sep="")}
    else {filename<-i}
    
    #read the values into a temp variable "monitor"
    monitor1<-read.csv(paste(directory,"/",filename,".csv",sep=""))
    
    #we want to combine all the data frames in id range into a single dataframe
    if (j==1) {monitor<-monitor1}
    else {monitor<-rbind(monitor,monitor1)}
    
    #increment storage counter
    j<-j+1
  }
  #return the result of the mean with NA removed
  mean(monitor[,pollutant],na.rm=TRUE)
}
