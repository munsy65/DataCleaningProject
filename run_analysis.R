##This script merges files for training, test, subject to create on data set.  It then cleans and corrects labels to create a tidy data set.  Then takes 
##that set to create a file of data averages for each subject

##Load library for need functions
library(plyr)
##Read text files for data merge
Xtrain <- read.table("UCI/train/X_train.txt")
Ytrain <- read.table("UCI/train/y_train.txt")
SubjectTrain <- read.table("UCI/train/subject_train.txt")

Xtest <- read.table("UCI/test/X_test.txt")
Ytest <- read.table("UCI/test/y_test.txt")
SubjectTest <- read.table("UCI/test/subject_test.txt")


##Merge data sets
dataX <- rbind(Xtrain,Xtest)
dataY <- rbind(Ytrain,Ytest)
subjectData <- rbind(SubjectTrain,SubjectTest)

##Read text file to create label data set
features <- read.table("UCI/features.txt")
##Extract varibles that contain only mean and standard deviation
stdMeanFeatures <- grep("-(mean|std)\\(\\)", features[,2])


##Create data set with merged and properly labelecd data
dataX <- dataX[,stdMeanFeatures]

names(dataX) <- features[stdMeanFeatures,2]

activities <- read.table("UCI/activity_labels.txt")

dataY[,1] <- activities[dataY[,1],2]

names(dataY) <- "Activity"

names(subjectData) <- "Subject"

SingleData<- cbind(subjectData,dataY,dataX)

##Create data set with averages for each activity by subject
DataAverages <- ddply(SingleData, .(Subject, Activity), function(x) colMeans(x[3:68]))

##Create output text file of data set
write.table(DataAverages, "Average_data.text", row.name=FALSE)
