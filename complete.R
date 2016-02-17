complete<-function(directory,id=1:332) {
  result_nob<-c(1:length(id))
  result_id<-c(1:length(id))
  
  for (i in 1:length(id)){
    #looping within the vector of monitors to check
    
    #We need to format the filename to be opened accordingly
    if(id[i]<10){filename<-paste("00",id[i],sep="")}
    else if (id[i]<100){filename<-paste("0",id[i],sep="")}
    else {filename<-id[i]}
    
    monitor<-read.csv(paste(directory,"/",filename,".csv",sep=""))
    result_nob[i]<-sum(complete.cases(monitor))
    result_id[i]<-id[i]
  }
  cbind(result_id,result_nob)
}