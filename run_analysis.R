## Coursera Data Cleaning Final Assignment

## Information on the data: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

setwd("c:/Data/Cleaning")


## 1.Merges the training and the test sets to create one data set.

##   Load the training and the test sets
##   activity_labels.txt tells the number code associated with the 6 observed movements
##   features.txt gives the list of observations and derived info from the accelerometer and gyroscope data
##          These correspond to the headings for the observations in the test and train data sets
##   In each of the test and training data sets, there are X_ measurements, Y_ measurements, and subjects
##        X_ are the measurements associated with the headings in features.txt
##        Y_ are the truth about the activity that the subject was performing during each measurement
##        subject_ are the subject codes for the people who performed the experiments
##        Test data should have 2947 measurements
##        Training data should have 7352 measurements

activity <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
feature <- read.table("./UCI HAR Dataset/features.txt", header = FALSE)

testx <- read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
testy <- read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
testsubj <- read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)

trainx <- read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
trainy <- read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
trainsubj <- read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)

##   Merge them
##   X_ data are the main observations. Use features.txt as column names.  Add y_ data as a column
##        and convert the Y data to meaningful words that are a factor.

xall <- rbind(testx, trainx)

featurelist <- as.list(feature)
names(xall)  <- make.names(as.character(featurelist[[2]]), unique = TRUE)

yall <- rbind(testy, trainy)
names(yall) <- c("trueactivity")

subjall <- rbind(testsubj, trainsubj)
names(subjall) <- c("subject")

## substitute the words for the activity code numbers

library(dplyr)
yall <- mutate(yall, activitylabel = factor(trueactivity, labels = activity$V2))


## include the true activity name as a column in the overall data set
xall <- mutate(xall, activitylabel = yall$activitylabel)  

## Include the subject associated with each observation
xall <- mutate(xall, subject = as.factor(subjall$subject))

## xall is now a data frame with all the data combined from test and training sets
##    including activity names and subjects.

## 2.Extracts only the measurements on the mean and standard deviation for each measurement. 

## subset out certain columns, but also need to keep the subject and true activity
xmeanstd <- xall[, c(563, 562, (grep("std|mean", names(xall), ignore.case = TRUE)))]


## 3.Uses descriptive activity names to name the activities in the data set
##   already done above

## 4.Appropriately labels the data set with descriptive variable names. 
##   already done above

## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## create a combined factor of subject and activity, add that column to data frame

xmeanstd2 <- mutate(xmeanstd, combolabel = paste(
                    as.character(xmeanstd$subject), 
                    as.character(xmeanstd$activitylabel), sep ="."))

split1 <- split(xmeanstd2, xmeanstd2$combolabel)

## out is a list of each subject/activity pair. 
## Each list element contains the average of each variable for that combination.
out <- lapply(split1, function(x) colMeans(x[,3:88]))

## create a new clean data frame with the variables as columns and the subject.activity 
##     combinations as each row.

final <- c(names(out)[1], out[[1]])
for (i in 2:length(out)) {
     final <- rbind(final, c(names(out)[i], out[[i]]))
}

finaldf <- as.data.frame(final)

## I should split the subject number and activity into two separate columns, but I don't have time.