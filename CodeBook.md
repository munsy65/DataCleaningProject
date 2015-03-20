
##Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency componen

##Raw Data 

The data selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

##Processed Data
 First, all the similar data is merged . By similar, we address those files having the same number of columns and referring to the same entities.  Only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from features.txt.  As activity data is addressed with values 1:6, activity names and IDs are taken from activity_labels.txt and are substituted in the dataset. Those columns with vague column names are corrected.  Finally, a new dataset is generated with all the average measures for each subject and activity type.  The output file is called Average_data.txt.

# Variables

* `trainX`, `trainY`, `testX`, `testY`, `subjectTrain` and `subjectTest` contain the data from the downloaded files.
* `dataX`, `dataY` and `subjectData` merge the previous datasets to further analysis.
* `features` contains the correct names for the `dataX` dataset, which are applied to the column names stored in `stdMeanFeatures`, a numeric vector used to extract the desired data.
* A similar approach is taken with activity names through the `activities` variable.
* `singleData` merges `dataX`, `dataY` and `subjectData` in a big dataset.
* Finally, `dataAverages` contains the relevant averages which will be later stored in a `.txt` file. `ddply()` from the plyr package is used to apply `colMeans()` and ease the development.
* 'tBodyAcc-mean()-X' 'tBodyAcc-mean()-Y''tBodyAcc-mean()-Z' "tBodyAcc-std()-X""tBodyAcc-std()-Y"           
"tBodyAcc-std()-Z" "tGravityAcc-mean()-X""tGravityAcc-mean()-Y""tGravityAcc-mean()-Z"
"tGravityAcc-std()-X""tGravityAcc-std()-Y""tGravityAcc-std()-Z""tBodyAccJerk-mean()-X""tBodyAccJerk-mean()-Y"       "tBodyAccJerk-mean()-Z""tBodyAccJerk-std()-X""tBodyAccJerk-std()-Y""tBodyAccJerk-std()-Z""tBodyGyro-mean()-X"        "tBodyGyro-mean()-Y""tBodyGyro-mean()-Z""tBodyGyro-std()-X" "tBodyGyro-std()-Y""tBodyGyro-std()-Z"       "tBodyGyroJerk-mean()-X""tBodyGyroJerk-mean()-Y""tBodyGyroJerk-mean()-Z""tBodyGyroJerk-std()-X"       "tBodyGyroJerk-std()-Y""tBodyGyroJerk-std()-Z""tBodyAccMag-mean()""tBodyAccMag-std()"           "tGravityAccMag-mean()""tGravityAccMag-std()""tBodyAccJerkMag-mean()"
"tBodyAccJerkMag-std()""tBodyGyroMag-mean()""tBodyGyroMag-std()""tBodyGyroJerkMag-mean()"     "tBodyGyroJerkMag-std()""fBodyAcc-mean()-X""fBodyAcc-mean()-Y""fBodyAcc-mean()-Z""fBodyAcc-std()-X"            "fBodyAcc-std()-Y""fBodyAcc-std()-Z""fBodyAccJerk-mean()-X""fBodyAccJerk-mean()-Y""fBodyAccJerk-mean()-Z"       "fBodyAccJerk-std()-X""fBodyAccJerk-std()-Y""fBodyAccJerk-std()-Z""fBodyGyro-mean()-X""fBodyGyro-mean()-Y"          "fBodyGyro-mean()-Z""fBodyGyro-std()-X""fBodyGyro-std()-Y""fBodyGyro-std()-Z""fBodyAccMag-mean()"          "fBodyAccMag-std()""fBodyBodyAccJerkMag-mean()"  "fBodyBodyAccJerkMag-std()""fBodyBodyGyroMag-mean()"     "fBodyBodyGyroMag-std()""fBodyBodyGyroJerkMag-mean()""fBodyBodyGyroJerkMag-std()" 
