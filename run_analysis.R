## Download and extract the compressed data from the source

fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dest <- "./datasciencecoursera/getdata%2Fprojectfiles%2FUCI HAR Dataset.zip"
download.file(fileURL,destfile=dest,)
date <- date()
unzip(dest,exdir = "./datasciencecoursera/get_clean_data")

## Read the uncompressed files into R
xtest <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/test/X_test.txt")
xtrain <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/train/X_train.txt")
features <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/features.txt")
ytest <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/test/y_test.txt")
ytrain <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/train/y_train.txt")
subjecttest <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/test/subject_test.txt")
subjecttrain <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/train/subject_train.txt")
activity_labels <- fread("./datasciencecoursera/get_clean_data/UCI HAR Dataset/activity_labels.txt")

## Add "features" column names to the test and train datasets
## Note:  this assumes the row order in the features dataset is identical to the column order in the test and training datasets
## Add "Subject" column header to the subject identifier dataset
## Note:  this assumes the row order in the subject dataset is identical to the row order in the test and training datasets
## Add "Activity" column header to the test and training
colnames(xtest) <- features[,as.character(features$V2)]
colnames(xtrain) <- features[,as.character(features$V2)]
colnames(subjecttest)<-"Subject"
colnames(subjecttrain)<-"Subject"

## 3. Uses descriptive activity names to name the activities in the data set
colnames(activity_labels) <-  c("V1","Activity")

## Append the appropriate subject ID to the test and training datasets
test <- cbind(ytest,subjecttest, xtest)
train <- cbind(ytrain,subjecttrain, xtrain)

## 1. Merges the training and the test sets to create one data set.
merged <- rbind(test,train)

## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
subset_columns <- merged[,c(1,2,grep("mean\\(|std\\(",colnames(merged))),with=FALSE]

## Merge the appropriate Activity based on Activity ID to the test and training datasets
## Eliminate the Activity_ID column when done
complete <- merge(activity_labels, subset_columns, by="V1", all.y=TRUE)[,-1]

## Create separate tables of mean and standard deviation data to allow them to be displayed as separate variables
mean_data <- complete[,c(1,2,grep("mean\\(",colnames(complete))),with=FALSE]
std_data <- complete[,c(1,2,grep("std\\(",colnames(complete))),with=FALSE]

## Transpose features to be a tidy dataset of independent observations leaving only mean or stddev variable column headers
tidy_mean <- gather(mean_data,feature,mean,-2:-1)
tidy_std <- gather(std_data,feature,stddev,-2:-1)

## Separate the feature from the dimension and the variable labels
parse_feature_mean <- cSplit(tidy_mean, 3, sep="-")
parse_feature_std <- cSplit(tidy_std, 3, sep="-")

## 5. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
## Recombine the tidy datasets with the features, dimensions, and 2 variables values as separate fields
final <- cbind(parse_feature_mean[,c(2,1,4,6,3)],parse_feature_std[,3])

## 4. Appropriately labels the data set with descriptive variable names.
colnames(final) <- c("Subject", "Activity", "Feature", "Dimension", "Mean", "StdDev")