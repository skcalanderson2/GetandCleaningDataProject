# Getting and Cleaning Data Project
## Project Requirements for Reproducabilty
This project requires that you have local access to the Human Activity Recognition Using Smartphones Dataset. This can be downloaded at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. The script run_analysis.R will check to see the current working directory has the raw directory already and if not it will down the raw date file and unzip it. This project also requires several R libraries. These include dplyr, plyr, readr, stringr, and reshape2. If you do not have these installed you will get errors. 

## Runnning the Processing and Analysis Script
To reproduce this analysis you can simple run the run_analysis.R script in R making sure to have the proper libraries installed.

## How the Script Works
The script first loads each of the raw data sets: training and test, X, y, and subject, into data frames. It then reads in the activity and variable labels into a vector and data frame respectfully. The code for the variable labels does a little work to remove the parantheses. Then we create a vector of these names and label our column variables with these labels.  

Now the script combines the test and training data frames, changes the Activity variable to a factor, and removes duplicate columns (there are a few).

We are ready now to create our second tidy data set. The key to understanding the final tidy data set is to understand there are different ways to represent data. In this case I elected to have each row of the final tidy data set represent a mean of a particular variable of a particular subject. This creates a "long" tidy data set. To create this "long" dataset, we first have to reshape our data, tell it that some of the columns are id's and some are values. The R command ```melt(req_data, id.vars = c("Activity", "Subject"))``` reshapes our data frame so that each row has an id consisting of the subject number variable and the activity variable. To get to the mean of each measurement, we then have to group our reshaped frame with the R command ```group_by(melted_data, Activity, Subject, variable)``` which creates a data frame with grouping by Activity, Subject, and variable. We then can get the mean of the variable values with the R command ```summarise(grouped_melted, mean=mean(value))```. This last command uses the grouping done previously to create the final tidy data set with each row being the mean of a variable of a particular activity of a particular subject. The final command writes the tidy data frame to a text file.