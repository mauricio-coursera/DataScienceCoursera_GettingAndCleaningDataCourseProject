Getting and Cleaning Data Course Project
========================================================

There are two datasets prepared for this project. One of them holds all the mean 
and std measurements (65 variables, described bellow) of 30 subjects in the 6 
activities found on the original dataset plus one variable for the activity and 
one for the subject, and the second one has the same collumns, but with the 
means of the 65 variables grouped by subject and activity.

To build these two datasets, the following steps were applied:
- the test and train activities (files test/y_test.txt and train/y_train.txt) 
were loaded (with an adjusted collumn name) and merged
- the activity labels (file activity_labels.txt) was loaded with an adjusted
collumn name and merged with the previous dataset
- the id collumn of the activity dataset was removed (the only remaining collum
was the activity names)
- the subject information for each group of measurements 
(files test/subject_test.txt and train/subject_train.txt) were loaded with an
adjusted collumn name and merged
- the actual test and train data were loaded (files test/X_test.txt and 
train/X_train.txt) and merged
- the collumn names for the measurements was loaded from the file features.txt
and assigned to the previous dataset
- the datasets with the subject, activity and measurements info were binded
together. Only the measurements on the means and std were kept (65 variables).
- this dataset was exported to the file "data.txt"
- another dataset was created with the averages of those 65 variables, grouped 
by activity and subject
- this second dataset was exported to the file "dataAvg.txt"

The 65 variables found on the tidy dataset "data.txt" (other than the subject 
and activity) are:

- [1] "tBodyAcc-mean()-X" 
- [2] "tBodyAcc-mean()-Y"
- [3] "tBodyAcc-mean()-Z"          
- [4] "tBodyAcc-std()-X"           
- [5] "tBodyAcc-std()-Y"           
- [6] "tBodyAcc-std()-Z"           
- [7] "tGravityAcc-mean()-X"       
- [8] "tGravityAcc-mean()-Y"       
- [9] "tGravityAcc-mean()-Z"       
- [10] "tGravityAcc-std()-X"        
- [11] "tGravityAcc-std()-Y"        
- [12] "tGravityAcc-std()-Z"        
- [13] "tBodyAccJerk-mean()-X"      
- [14] "tBodyAccJerk-mean()-Y"      
- [15] "tBodyAccJerk-mean()-Z"      
- [16] "tBodyAccJerk-std()-X"       
- [17] "tBodyAccJerk-std()-Y"       
- [18] "tBodyAccJerk-std()-Z"       
- [19] "tBodyGyro-mean()-X"         
- [20] "tBodyGyro-mean()-Y"         
- [21] "tBodyGyro-mean()-Z"         
- [22] "tBodyGyro-std()-X"          
- [23] "tBodyGyro-std()-Y"          
- [24] "tBodyGyro-std()-Z"          
- [25] "tBodyGyroJerk-mean()-X"     
- [26] "tBodyGyroJerk-mean()-Y"     
- [27] "tBodyGyroJerk-mean()-Z"     
- [28] "tBodyGyroJerk-std()-X"      
- [29] "tBodyGyroJerk-std()-Y"      
- [30] "tBodyGyroJerk-std()-Z"      
- [31] "tBodyAccMag-mean()"         
- [32] "tBodyAccMag-std()"          
- [33] "tGravityAccMag-mean()"      
- [34] "tGravityAccMag-std()"       
- [35] "tBodyAccJerkMag-mean()"     
- [36] "tBodyAccJerkMag-std()"      
- [37] "tBodyGyroMag-mean()"        
- [38] "tBodyGyroMag-std()"         
- [39] "tBodyGyroJerkMag-mean()"    
- [40] "tBodyGyroJerkMag-std()"     
- [41] "fBodyAcc-mean()-X"          
- [42] "fBodyAcc-mean()-Y"          
- [43] "fBodyAcc-mean()-Z"          
- [44] "fBodyAcc-std()-X"           
- [45] "fBodyAcc-std()-Y"           
- [46] "fBodyAcc-std()-Z"           
- [47] "fBodyAccJerk-max()-X"       
- [48] "fBodyAccJerk-mad()-Z"       
- [49] "fBodyAccJerk-mad()-Y"       
- [50] "fBodyAccJerk-mad()-X"       
- [51] "fBodyAccJerk-std()-Z"       
- [52] "fBodyGyro-mean()-X"         
- [53] "fBodyGyro-mean()-Y"         
- [54] "fBodyGyro-mean()-Z"         
- [55] "fBodyGyro-std()-X"          
- [56] "fBodyGyro-std()-Y"          
- [57] "fBodyGyro-std()-Z"          
- [58] "fBodyAccMag-mean()"         
- [59] "fBodyAccMag-std()"          
- [60] "fBodyBodyAccJerkMag-mean()" 
- [61] "fBodyBodyAccJerkMag-std()"  
- [62] "fBodyBodyGyroMag-mean()"    
- [63] "fBodyBodyGyroMag-std()"     
- [64] "fBodyBodyGyroJerkMag-mean()"
- [65] "fBodyBodyGyroJerkMag-std()" 

The subject is a numeric field, with values from 1 to 30, and the activity
has one of the 6 possible activities the subjects were performing during the
measurements.

The dataset "dataAvg.txt" holds the same collumns, but with the mean of the
measurements grouped by subject and activity.