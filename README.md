# GCData
  ## Import the test data
  ## Import the training data

  ## Task 1) Merge the training and the test sets to create one data set.
    ## Combine the X data, Y data, and subject row identification into full versions of each
    ## Now the data frames are joined, it's worth naming the columns in x_full from features.txt

  ## Task 2) Extract only the measurements on the mean and standard deviation for each measurement
    ## The columns with the desired measurements are labeled using mean() and std() so grepl on the column names
    ## looking for partial matches will flag them. '|' will create a vector that is true if either is matched.
    ## Then putting the new columns in a pared down data frame is simple:

  ## Task 3) Uses descriptive activity names to name the activities in the data set
  ## Task 4) Appropriately labels the data set with descriptive activity names. 
     ## To do it all at once.

  ## Task 5) Creates a second, independent tidy data set with the average of each variable for each activity and each 
  ## subject. 

  ## gacd_tidy_wk.txt is it

