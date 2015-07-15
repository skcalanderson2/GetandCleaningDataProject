### Code Book for Tidy Data File
This file describes the data and structure in the tidy data file named **secondtidy_ds.txt** located in the Git repository. The data represents a single mean value of the means and standard deviations of an individual measurement of a particular activity of a particular subject. It is in a "long" tidy format.

**Activity**: Factor with 6 levels -  WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING  
**Subject**: Integer identifing individual subjects  
**variable**: Factor with 79 levels, these are the means of the raw signal values representing of the means and standard deviations of the actual raw data. Below are the various sensors measured. The sensors with XYZ have three measurement represented in the data, i.e. X, Y, and Z. The others simply have 1 corresponding to the magnitude. 
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

**mean**: This is the calculated mean of the means and standard deviations of the individual measurements above for each activity of each subject.