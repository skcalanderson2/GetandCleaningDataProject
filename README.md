# Getting and Cleaning Data Project
## Project Requirements for Reproducabilty
This project requires that you have local access to the Human Activity Recognition Using Smartphones Dataset. This can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The script run_analysis.R will check to see the current working directory has the raw directory already and if not it will download the raw date file and unzip it. This project also requires several R libraries. These include dplyr, plyr, readr, stringr, and reshape2. If you do not have these installed you will get errors. 

## Files in Repository
* .gitignore - our gitignore file that tells git to ignore, i.e. leave out of our repository
* Getting_and_Cleaning_Data_Project.Rproj - the R project file
* History.Rhistory - an R history file that shows some of the work I did to create the run_analysis.R script
* README.md - this file
* run_analysis.R - this is the R script that processes our raw data files, analyses them, and produces the final tidy data file. 

## Runnning the Processing and Analysis Script
To reproduce this analysis you can simply run the run_analysis.R script in R making sure to have the proper libraries installed.

## How the Script Works
The script first loads each of the raw data sets: training and test, X, y, and subject, into data frames. It then reads in the activity and variable labels into a vector and data frame respectfully. The code for the variable labels does a little work to remove the parentheses. Then we create a vector of these names and label our column variables with these labels.  

Now the script combines the test and training data frames, changes the Activity variable to a factor, and removes duplicate columns (there are a few).

We are ready now to create our second tidy data set. The key to understanding the final tidy data set is to understand there are different ways to represent data. In this case I elected to have each row of the final tidy data set represent a mean of a particular variable of a particular activity of a particular subject. This creates a "long" tidy data set. To create this "long" data set, we first have to reshape our data, tell it that some of the columns are id's and some are values. The R command ```melt(req_data, id.vars = c("Activity", "Subject"))``` reshapes our data frame so that each row has an id consisting of the subject number variable and the activity variable. To get to the mean of each measurement, we then have to group our reshaped frame with the R command ```group_by(melted_data, Activity, Subject, variable)``` which creates a data frame with grouping by Activity, Subject, and variable. We then can get the mean of the variable values with the R command ```summarise(grouped_melted, mean=mean(value))```. This last command uses the grouping done previously to create the final tidy data set with each row being the mean of a variable of a particular activity of a particular subject. This is the long form as mentioned in the rubric as either long or wide form is acceptable, see https://class.coursera.org/getdata-030/forum/thread?thread_id=107 for discussion. The final command writes the tidy data frame to a text file.