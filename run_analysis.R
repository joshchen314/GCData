  ## Import the test data
  
  X_test<-read.table("./UCI HAR Dataset/test/X_test.txt")
  Y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
  sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt")
  
  ## Import the training data
  X_train<-read.table("./UCI HAR Dataset/train/X_train.txt")
  Y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
  sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt")
  
  ## Task 1) Merge the training and the test sets to create one data set.
    ## Combine the X data, Y data, and subject row identification into full versions of each
  X_full<-rbind(X_test, X_train)
  Y_full<-rbind(Y_test, Y_train)
  sub_full<-rbind(sub_test, sub_train)
  
     ## Now the data frames are joined, it's worth naming the columns in x_full from features.txt
  features <- read.table("./UCI HAR Dataset/features.txt")
  colnames(X_full)<-features[,2]
  
  ## Task 2) Extract only the measurements on the mean and standard deviation for each measurement
    ## The columns with the desired measurements are labeled using mean() and std() so grepl on the column names
    ## looking for partial matches will flag them. '|' will create a vector that is true if either is matched.
  rightcols<- grepl("mean()",colnames(X_full)) | grepl("std()",colnames(X_full))
  
     ## Then putting the new columns in a pared down data frame is simple:
  X_mean_std <- X_full[,rightcols]
  
  ## Task 3) Uses descriptive activity names to name the activities in the data set
  ## Task 4) Appropriately labels the data set with descriptive activity names. 
     ## To do it all at once.
  
      activities<-read.table("./UCI HAR Dataset/activity_labels.txt")
      Y_factor <- as.factor(Y_full[,1])
      library(plyr)
      Y_factor <- mapvalues(Y_factor,from = as.character(activities[,1]), to = as.character(activities[,2]))
      X_mean_std <- cbind(Y_factor, X_mean_std)  
      colnames(X_mean_std)[1] <- "activity"
      X_mean_std <- cbind(subject_full, X_mean_std)
      colnames(X_mean_std)[1] <- "subject"
   
  ## Task 5) Creates a second, independent tidy data set with the average of each variable for each activity and each 
  ## subject. 
  library(reshape2)
  X_melt<- melt(X_mean_std,id.vars=c("subject","activity"))
  gacd_tidy_wk <- dcast(X_melt, subject + activity ~ ..., mean)
  
  ## gacd_tidy_wk is it
  write.table(gacd_tidy_wk, file="gacd_tidy_wk.txt", row.names = FALSE)
  
