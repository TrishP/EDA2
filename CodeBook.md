---
title: "CodeBook"
author: "Trish Priest"
date: "February 28, 2016"
output: html_document
---

The following was performed on the original data here for the Human Activity Recognition Using Smartphones
project:
      https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The original source site and additional information:
      http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

See the feature_info.txt file for detailed information about the measurements.

The data set in this repository is a cleaned version.  The following steps were performed:
1.  Combine the test and training data sets.  Test first, then training.
2.  Create a subset of the data set containing only mean and standard deviation for each measurement.
3.  Add the Subject code for each measurement row into the data set.
4.  Add the true observed activity for each measurement row. 
     (LAYING, STANDING, SITTING, WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS)
     xmeanstd2 is the variable in run_analysis.R for this data set.
5.  Calculate the average of each variable for each subject and activity combination.
     finaldf is the variable in run_analysis.R for this data set.
     finaldf.txt was written using write.table() and is included in the repository.


The following variables in the finaldf.txt file refer to the average of all the measurements for the
corresponding measurement in the original data set for a given subject and activity.  These are for 
subset of the original variable set containing mean and standard deviation information.  The mean was
calculated using the mean() function in R over a combination of the training and test data sets, so it
includes all observations.  See feature_info.txt for additional information about the measurements.

"tBodyAcc.mean...X" 
"tBodyAcc.mean...Y" 
"tBodyAcc.mean...Z" 
"tBodyAcc.std...X" 
"tBodyAcc.std...Y" 
"tBodyAcc.std...Z" 
"tGravityAcc.mean...X" 
"tGravityAcc.mean...Y" 
"tGravityAcc.mean...Z" 
"tGravityAcc.std...X" 
"tGravityAcc.std...Y" 
"tGravityAcc.std...Z" 
"tBodyAccJerk.mean...X" 
"tBodyAccJerk.mean...Y" 
"tBodyAccJerk.mean...Z" 
"tBodyAccJerk.std...X" 
"tBodyAccJerk.std...Y" 
"tBodyAccJerk.std...Z" 
"tBodyGyro.mean...X" 
"tBodyGyro.mean...Y" 
"tBodyGyro.mean...Z" 
"tBodyGyro.std...X" 
"tBodyGyro.std...Y" 
"tBodyGyro.std...Z" 
"tBodyGyroJerk.mean...X" 
"tBodyGyroJerk.mean...Y" 
"tBodyGyroJerk.mean...Z" 
"tBodyGyroJerk.std...X" 
"tBodyGyroJerk.std...Y" 
"tBodyGyroJerk.std...Z" 
"tBodyAccMag.mean.." 
"tBodyAccMag.std.." 
"tGravityAccMag.mean.." 
"tGravityAccMag.std.." 
"tBodyAccJerkMag.mean.." 
"tBodyAccJerkMag.std.." 
"tBodyGyroMag.mean.." 
"tBodyGyroMag.std.." 
"tBodyGyroJerkMag.mean.." 
"tBodyGyroJerkMag.std.." 
"fBodyAcc.mean...X" 
"fBodyAcc.mean...Y" 
"fBodyAcc.mean...Z" 
"fBodyAcc.std...X" 
"fBodyAcc.std...Y" 
"fBodyAcc.std...Z" 
"fBodyAcc.meanFreq...X" 
"fBodyAcc.meanFreq...Y" 
"fBodyAcc.meanFreq...Z" 
"fBodyAccJerk.mean...X" 
"fBodyAccJerk.mean...Y" 
"fBodyAccJerk.mean...Z" 
"fBodyAccJerk.std...X" 
"fBodyAccJerk.std...Y" 
"fBodyAccJerk.std...Z" 
"fBodyAccJerk.meanFreq...X" 
"fBodyAccJerk.meanFreq...Y" 
"fBodyAccJerk.meanFreq...Z" 
"fBodyGyro.mean...X" 
"fBodyGyro.mean...Y" 
"fBodyGyro.mean...Z" 
"fBodyGyro.std...X" 
"fBodyGyro.std...Y" 
"fBodyGyro.std...Z" 
"fBodyGyro.meanFreq...X" 
"fBodyGyro.meanFreq...Y" 
"fBodyGyro.meanFreq...Z" 
"fBodyAccMag.mean.." 
"fBodyAccMag.std.." 
"fBodyAccMag.meanFreq.." 
"fBodyBodyAccJerkMag.mean.." 
"fBodyBodyAccJerkMag.std.." 
"fBodyBodyAccJerkMag.meanFreq.." 
"fBodyBodyGyroMag.mean.." 
"fBodyBodyGyroMag.std.." 
"fBodyBodyGyroMag.meanFreq.." 
"fBodyBodyGyroJerkMag.mean.." 
"fBodyBodyGyroJerkMag.std.." 
"fBodyBodyGyroJerkMag.meanFreq.." 
"angle.tBodyAccMean.gravity." 
"angle.tBodyAccJerkMean..gravityMean." 
"angle.tBodyGyroMean.gravityMean." 
"angle.tBodyGyroJerkMean.gravityMean." 
"angle.X.gravityMean." 
"angle.Y.gravityMean." 
"angle.Z.gravityMean."

