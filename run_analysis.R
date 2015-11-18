# loading required libraries
library(plyr)
library(dplyr)

# ------------------------------------------------------------------------------------
# Step 1
# Downloading and unzipping data from the Internet
filename <- "getdata_dataset.zip"

if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename)
}  
if (!file.exists("UCI HAR Dataset")) { 
  unzip(filename) 
}

# ------------------------------------------------------------------------------------
# Step 2
# Loading data to RStudio
training = read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
training[, 562] = read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
training[, 563] = read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)

testing = read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
testing[, 562] = read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE)
testing[, 563] = read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)

activityLabels = read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# ------------------------------------------------------------------------------------
# Step 3
## Merging the training and the test sets to create one data set
data = rbind(training, testing)

# ------------------------------------------------------------------------------------
# Step 4
# Extracting only the measurements on the mean and standard deviation for each measurement
features <- read.table("UCI HAR Dataset/features.txt")

## Reading features data and make reformatting its names for the purposes of future analysis
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[, 2] = gsub('-mean', 'Mean', features[, 2])
features[, 2] = gsub('-std', 'Std', features[, 2])
features[, 2] = gsub('[-()]', '', features[, 2])

## Selecting data on mean and std. dev.
colsNeeded <- grep(".*Mean.*|.*Std.*", features[, 2])

# ------------------------------------------------------------------------------------
# Step 5
# Appropriately labeling the data set with descriptive variable names
## Selecting needed features
featuresNeeded <- features[colsNeeded, ]

## Adding last two columns - subject and activity
colsNeeded <- c(colsNeeded, 562, 563)

## Selecting columns from merged dataset
data <- data[, colsNeeded]

## Adding the column names (features) to merged dataset
colnames(data) <- tolower(c(featuresNeeded$V2, "Activity", "Subject"))

# ------------------------------------------------------------------------------------
# Step 6
# Naming the activities in the data set using descriptive activity names 
data$activity <- activityLabels[data$activity, 2]

# ------------------------------------------------------------------------------------
# Step 7
# From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject
tidy_data <- plyr:: ddply(data, .(subject, activity), function(x) colMeans(select(x, -activity, -subject)))

# ------------------------------------------------------------------------------------
# Step 8
# writing file with tidy dataset
write.table(tidy_data, "tidy_data.txt", row.names = FALSE)