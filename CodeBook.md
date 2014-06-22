Getting and Cleaning Data Course Project
========================================================

There are two datasets prepared for this project. One of them holds all the mean 
and std measurements (65 variables) of 30 subjects in the 6 activities found on 
the original dataset plus one variable for the activity and one for the subject, 
and the second one has the same collumns, but with the means of the 65 variables
grouped by subject and activity.

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
- this dataset was exported to the file "data.csv"
- another dataset was created with the averages of those 65 variables, grouped 
by activity and subject
- this second dataset was exported to the file "dataAvg.csv"
