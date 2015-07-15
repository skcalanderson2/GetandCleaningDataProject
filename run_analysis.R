
## Load required libraries
library(readr)
library(plyr)
library(dplyr)

## Read in test dataset, labels, and subject
data_test <- read_fwf("UCI HAR Dataset/test/X_test.txt", fwf_empty("UCI HAR Dataset/test/X_test.txt"))
labels_test <- read_csv("UCI HAR Dataset/test/y_test.txt", col_names = FALSE)
subjects_test <- read_csv("UCI HAR Dataset/test/subject_test.txt", col_names = FALSE)

## Read in training dataset, labels, and subject
data_train <- read_fwf("UCI HAR Dataset/train/X_train.txt", fwf_empty("UCI HAR Dataset/train/X_train.txt"))
labels_train <- read_csv("UCI HAR Dataset/train/y_train.txt", col_names = FALSE)
subjects_train <- read_csv("UCI HAR Dataset/train/subject_train.txt", col_names = FALSE)

## Read in activity labels
activity_labels <- read_delim("UCI HAR Dataset/activity_labels.txt", delim = " ", col_names = FALSE)

## Read in variable names, i.e. features
variable_names <- read_delim("UCI HAR Dataset/features.txt", delim = " ", col_names = FALSE)
variable_names_vector <- str_replace(variable_names$X2, "\\(.*\\)", "") ## Get rid of the parantheses and put into a vector
variable_names_vector <- (c(variable_names_vector, "Activity", "Subject"))

## Combine up Test data set
data_test <- cbind(data_test, data.frame(labels_test),data.frame(subjects_test))

## Add variable names to columns
colnames(data_test) <- variable_names_vector

## Combine up Train data set
data_train <- cbind(data_train, data.frame(labels_train),data.frame(subjects_train))

## Add variable names to columns
colnames(data_train) <- variable_names_vector

## Combine Test and Train into one data frame
data_all <- rbind(data_test, data_train)

## Change Activity to a Factor with correct labels
data_all$Activity <- factor(data_all$Activity, levels = 1:6, labels=activity_labels$X2)

