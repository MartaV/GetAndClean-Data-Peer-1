Codebook

Sources

Raw data:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HA%20Dataset.zip 

Description: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 


Initial data as collected from source quoted above, came in two sets: one for the training group of individuals and one for the testers. Labels for activities were stored in separate files. Our task was to recast the data into a smaller subset relating only information of interest that in this case were the std and mean measurements from all the measurements performed. Our task was arriving at a clean, tidy data set, with proper labelling and average of each variable for each activity and each subject combination.


Analysis steps and transformations:

1. Import test data 
2. Import train data
3. Combine test and train data into a data set now containing all the available information in one place
4. Label the data set using the features.txt file
5. Label the data set using the activity_names.txt
6. Extract columns with mean or std measurements
7. Melt data keeping Subject activity nd activityName as indices
8. Recast available data into a new data frame including subject, activity, activityName, mean and std feature data
9. Write data frame to file.



Variable names of tidy data set:


[1] "Subject"                     "Activity"                   
 [3] "ActivityName"                "tBodyAcc-mean()-X"          
 [5] "tBodyAcc-mean()-Y"           "tBodyAcc-mean()-Z"          
 [7] "tGravityAcc-mean()-X"        "tGravityAcc-mean()-Y"       
 [9] "tGravityAcc-mean()-Z"        "tBodyAccJerk-mean()-X"      
[11] "tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z"      
[13] "tBodyGyro-mean()-X"          "tBodyGyro-mean()-Y"         
[15] "tBodyGyro-mean()-Z"          "tBodyGyroJerk-mean()-X"     
[17] "tBodyGyroJerk-mean()-Y"      "tBodyGyroJerk-mean()-Z"     
[19] "tBodyAccMag-mean()"          "tGravityAccMag-mean()"      
[21] "tBodyAccJerkMag-mean()"      "tBodyGyroMag-mean()"        
[23] "tBodyGyroJerkMag-mean()"     "fBodyAcc-mean()-X"          
[25] "fBodyAcc-mean()-Y"           "fBodyAcc-mean()-Z"          
[27] "fBodyAccJerk-mean()-X"       "fBodyAccJerk-mean()-Y"      
[29] "fBodyAccJerk-mean()-Z"       "fBodyGyro-mean()-X"         
[31] "fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z"         
[33] "fBodyAccMag-mean()"          "fBodyBodyAccJerkMag-mean()" 
[35] "fBodyBodyGyroMag-mean()"     "fBodyBodyGyroJerkMag-mean()"
[37] "tBodyAcc-std()-X"            "tBodyAcc-std()-Y"           
[39] "tBodyAcc-std()-Z"            "tGravityAcc-std()-X"        
[41] "tGravityAcc-std()-Y"         "tGravityAcc-std()-Z"        
[43] "tBodyAccJerk-std()-X"        "tBodyAccJerk-std()-Y"       
[45] "tBodyAccJerk-std()-Z"        "tBodyGyro-std()-X"          
[47] "tBodyGyro-std()-Y"           "tBodyGyro-std()-Z"          
[49] "tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y"      
[51] "tBodyGyroJerk-std()-Z"       "tBodyAccMag-std()"          
[53] "tGravityAccMag-std()"        "tBodyAccJerkMag-std()"      
[55] "tBodyGyroMag-std()"          "tBodyGyroJerkMag-std()"     
[57] "fBodyAcc-std()-X"            "fBodyAcc-std()-Y"           
[59] "fBodyAcc-std()-Z"            "fBodyAccJerk-std()-X"       
[61] "fBodyAccJerk-std()-Y"        "fBodyAccJerk-std()-Z"       
[63] "fBodyGyro-std()-X"           "fBodyGyro-std()-Y"          
[65] "fBodyGyro-std()-Z"           "fBodyAccMag-std()"          
[67] "fBodyBodyAccJerkMag-std()"   "fBodyBodyGyroMag-std()"     
[69] "fBodyBodyGyroJerkMag-std()" 

