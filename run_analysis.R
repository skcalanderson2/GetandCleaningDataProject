
## Load required libraries
library(readr)
library(plyr)
library(dplyr)

## Read in test dataset and labels
data_test <- read_fwf("UCI_HAR_Dataset/test/X_test.txt", fwf_empty("UCI_HAR_Dataset/test/X_test.txt"))
labels_test <- read_csv("UCI_HAR_Dataset/test/y_test.txt")

## Read in training dataset and labels
x_train <- read_fwf("UCI_HAR_Dataset/train/X_train.txt", fwf_empty("UCI_HAR_Dataset/train/X_train.txt"))
labels_train <- read_csv("UCI_HAR_Dataset/train/y_train.txt")

## Read in activity labels
activity_labels <- read_delim("UCI_HAR_Dataset/activity_labels.txt", delim = " ")
