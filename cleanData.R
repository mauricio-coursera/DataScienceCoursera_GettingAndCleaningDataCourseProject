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

# get subject data from test and train sets
subjectTest <- read.table('UCI HAR Dataset/test/subject_test.txt', 
                          col.names=c('subject'))
subjectTrain <- read.table('UCI HAR Dataset/train/subject_train.txt', 
                           col.names=c('subject'))
subject <- rbind(subjectTest,subjectTrain)

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

# bind everything together, keeping only measurements with mean and std
data <- cbind(subject, activity,
            subjectData[,c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,
                           227,228,240,241,253,254,266:271,354:350,424:429,
                           503,504,516,517,529,530,542,543)])

# calculate the average of the measurements in another dataframe
library(reshape2)
dataMelt <- melt(data,id=c('subject','activity'))
dataAvg <- dcast(dataMelt, activity + subject ~ variable, mean)

# remove temporary objetcs
remove(subjectData, subjectDataTest, subjectDataTrain,
       subjectDataColNames, dataMelt,
       subject, subjectTest, subjectTrain,
       activity, act, actTest, actTrain, actLabels)

# save the datasets to disk
write.csv2(data,'data.csv',row.names=FALSE)
write.csv2(dataAvg,'dataAvg.csv',row.names=FALSE)