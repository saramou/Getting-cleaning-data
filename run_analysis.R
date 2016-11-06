library(plyr)

print("Run the run_analysis() function to get the output")

#Download and unzip the zip file
downloadUnzip<-function(url,dest){
  #Download and unzip the zip file
  file<-download.file(url, destfile = dest, method = "auto")
  unzip(dest)
}

#function to read the test and train datasets and combine them
readDataSets<-function(set)
{
  #Creates the paths for the three files : subject, X and Y
  subjectpath<-paste("UCI HAR Dataset/",set,"/subject_",set,".txt",sep="")
  XPath<-paste("UCI HAR Dataset/",set,"/X_",set,".txt",sep="")
  YPath<-paste("UCI HAR Dataset/",set,"/Y_",set,".txt",sep="")
  #read the txt files
  subject<-read.table(subjectpath,stringsAsFactors = F)
  X<-read.table(XPath,stringsAsFactors = F)
  Y<-read.table(YPath,stringsAsFactors = F)
  #Combine the three files
  set<-cbind(subject,Y,X)
}

run_analysis<-function()
{
  #Download and unzip the zip file
  url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  downloadUnzip(url,"dataset.zip")
  
  #labels of the columns
  activity_labels<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors = F)
  features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors = F)
  name<-c("Subject","Activity",features[,2])
  
  #Read & load the test and train datasets
  test<-readDataSets("test")
  train<-readDataSets("train")
  
  #Merges the training and the test sets to create one data set
  all<-rbind(test,train)

  #rename the columns
  colnames(all)<-name
  
  #find the indexes of Mean and Std columns
  WantedFeatures<-grep("*mean*|*std*",names(all))
  #Add the first index (subject) and second index (Activity)
  WantedFeatures<-c(1,2,WantedFeatures)
  
  #Extracts only the measurements on the mean and standard deviation for each measurement
  all<-all[,WantedFeatures]
  
  #Appropriately labels the data set with descriptive variable names
  names(all)<-gsub("-mean"," Mean",names(all))
  names(all)<-gsub("-std"," Std",names(all))
  names(all)<-gsub("[()]","",names(all))
  names(all)<-gsub("-"," ",names(all))
  names(all)<-gsub("^t","Time ",names(all))
  names(all)<-gsub("^f","Freq ",names(all))
  
  #Uses descriptive activity names to name the activities in the data set
  all$Activity<-factor(all$Activity,levels=activity_labels[,1],labels=activity_labels[,2])
  
  #Averaging the columns for every couple Subject x Activity
  tidyAll<-ddply(all,.(Subject,Activity),function(x) colMeans(x[,3:length(names(x))]))
  
  #Data output
  write.table(tidyAll,"tidyAll.txt",row.names=FALSE)
  
  tidyAll
  
}