# CodeBook for Tidy Data
Irina Goloshchapova  
18.11.2015  

# Introduction

The script `run_analysis.R` performs the 8 steps including those required for the course project accomplishment.  
  1. Downloading and unzipping data from the Internet.  
  2. Loading unzipped data to RStudio.  
  3. Merging the training and the test sets to create one data set. The *first* step required for the course project accomplishment.  
  4. Extracting only the measurements on the mean and standard deviation for each measurement. The *second* step required for the course project accomplishment.    
  5. Appropriately labeling the data set with descriptive variable names. The *fourth* step required for the course project accomplishment.  
  6. Naming the activities in the data set using descriptive activity names. The *third* step required for the course project accomplishment.  
  7.  From the data set in step 6, creates a second, independent tidy data set with the average of each variable for each activity and each subject. The *fifth* step required for the course project accomplishment.  
      The output file is called `tidy_data.txt` and uploaded to the github repository.

# Data

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

# Variables and objects
- `data` contains merged data from the downloaded the training and the test sets with last to columns representing `activity` descriptive labels and `subject`.  
- `features` contains correct names for the `data` object.  
- `featuresNeeded` represents  column names  for the features required by the course projectconditions - only the measurements on the mean and standard deviation for each measurement.  
- `activityLabels` contains activities descriptive names.  
- `tidy_data` contains independent tidy data set with the average of each variable for each `activity` and each `subject`.  
