
## Load required libraries
library(readr)
library(plyr)
library(dplyr)

## Read in test dataset, labels, and subject
data_test <- read_fwf("UCI_HAR_Dataset/test/X_test.txt", fwf_empty("UCI_HAR_Dataset/test/X_test.txt"))
labels_test <- read_csv("UCI_HAR_Dataset/test/y_test.txt")
subjects_test <- read_csv("UCI_HAR_Dataset/test/subject_test.txt")

## Read in training dataset, labels, and subject
x_train <- read_fwf("UCI_HAR_Dataset/train/X_train.txt", fwf_empty("UCI_HAR_Dataset/train/X_train.txt"))
labels_train <- read_csv("UCI_HAR_Dataset/train/y_train.txt")
subjects_train <- read_csv("UCI_HAR_Dataset/train/subject_train.txt")

## Read in activity labels
activity_labels <- read_delim("UCI_HAR_Dataset/activity_labels.txt", delim = " ")

## Read in variable names, i.e. features
variable_names <- read_delim("UCI_HAR_Dataset/features.txt", delim = " ")