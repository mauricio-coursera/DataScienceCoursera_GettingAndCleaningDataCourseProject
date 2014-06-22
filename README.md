README
========================================================

The project is composed of the files

- README.md: this file you are reading
- CodeBook.md: describes how the files data.csv and dataAvg.csv were created
- data.csv: file with the tidy data required for this project
- dataAvg.csv: file with the average of the variables of the file data.csv,
grouped by subject and activity
- run_analysis.R: file responsible for creating the two "csv" files with the tidy 
data required for this project
- https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip: zip with several files with raw data used in this project:
  - activity_labels.txt: maps the activities IDs with human readable names
  - features.txt: holds the variable names, and is used to name the collumns
    on the finished dataset   
  - "test" directory: holds the test data:
      - test/subject_test.txt: subject information (from which subject the 
        measurements of that line were taken)
      - test/X_test.txt: the actual measurements
      - test/Y_test.txt: the activity code for that group of measurements
  - "train" directory: holds the train data:
      - train/subject_train.txt: subject information (from which subject the 
        measurements of that line were taken)
      - train/X_train.txt: the actual measurements
      - train/Y_train.txt: the activity code for that group of measurements

The run_analysis.R file uses a series of "read.table" commands to load the several 
files with raw data.

Bellow is the sequence of commands to get activity data for test and train
sets, and to properly label the collumns:

```{r}
# get activity data from test and train sets
actTest <- read.table('UCI HAR Dataset/test/y_test.txt', 
                      col.names=c('idActivity'))
actTrain <- read.table('UCI HAR Dataset/train/y_train.txt', 
                       col.names=c('idActivity'))
act <- rbind(actTest,actTrain)
actLabels <- read.table('UCI HAR Dataset/activity_labels.txt', 
                        col.names=c('idActivity','activity'))
activity <- merge(act,actLabels,by=c('idActivity'))
activity <- activity[,'activity']
```

The subject data is gathered with the commands bellow:

```{r}
# get subject data from test and train sets
subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt', 
                          col.names=c('subject'))
subjectTrain <- read.table('UCI HAR Dataset/train/subject_train.txt', 
                           col.names=c('subject'))
subject <- rbind(subjectTest,subjectTrain)
```

Then the measurements are gathered and it's collumn names are adjusted:

```{r}
# get measurements data from test and train sets
subjectDataTest <- read.table('UCI HAR Dataset/test/X_test.txt', header=FALSE, 
                              colClasses=c(rep('numeric',561)))
subjectDataTrain <- read.table('UCI HAR Dataset/train/X_train.txt', header=FALSE, 
                               colClasses=c(rep('numeric',561)))
subjectData<-rbind(subjectDataTest,subjectDataTrain)

# adjust measurement data col names
subjectDataColNames <- read.table('UCI HAR Dataset/features.txt', 
                                  col.names=c('id','feature'))
colnames(subjectData) <- subjectDataColNames[,2]
```

Everything is binded together to get only one tidy dataset:

```{r}
# bind everything together, keeping only measurements with mean and std
data <- cbind(subject, activity,
            subjectData[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,
                           227,228,240,241,253,254,266:271,354:350,424:429,
                           503,504,516,517,529,530,542,543)])
```

The averages were calculated using melt and dcast:

```{r}
# calculate the average of the measurements in another dataframe
library(reshape2)
dataMelt <- melt(data,id=c('subject','activity'))
dataAvg <- dcast(dataMelt, activity + subject ~ variable, mean)
```

Finally, all the temporary objects are removed from memory and the two tidy 
datasets are saved to disk:

```{r}
# remove temporary objetcs
remove(subjectData, subjectDataTest, subjectDataTrain,
       subjectDataColNames, dataMelt,
       subject, subjectTest, subjectTrain,
       activity, act, actTest, actTrain, actLabels)
       
# save the datasets to disk
write.csv(data,'data.txt',row.names=FALSE)
write.csv(dataAvg,'dataAvg.txt',row.names=FALSE)
```
