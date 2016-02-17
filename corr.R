corr<-function(directory,threshold=0){
  source("complete.R")
  x<-complete("specdata")
  counter<-0

  
  for (j in 1:nrow(x)) {
    if (x[j,2]>threshold) {
      counter<-counter+1
    }
  }
  
  monitor<-c(rep(0,counter))
  counter<-0
  
  for (i in 1:nrow(x)) {
    if (x[i,2]>threshold) {
      counter<-counter+1
      
      #isolate the filename to open 
      if(i<10){filename<-paste("00",i,sep="")}
      else if (i<100){filename<-paste("0",i,sep="")}
      else {filename<-i}
      
      #We've read the data frame for the monitor above threshold
      temp<-read.csv(paste(directory,"/",filename,".csv",sep=""))
      temp<-temp[complete.cases(temp),]
      monitor[counter]<-cor(temp$sulfate,temp$nitrate)
      

      
    } #finish processing the > threshold value
  } #finished all rows
  monitor
}
