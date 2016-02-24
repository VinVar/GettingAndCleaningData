# Getting And Cleaning Data

## Overview

The goal is to prepare tidy data that can be used for later analysis. 

Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data used is collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Script Name
**run_analysis.R**

## Library
Please install the **dplyr** library which is needed to run this script. 
  
## Prior to running the script:
Once the data is downloaded and unzipped, make sure you set the working directory to your UCI HAR Dataset folder.

# Summary

1. Merges the training and the test sets to create one data set 

2. Extracts only the measurements on the mean and standard deviation for each measurement.

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive variable names.

5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
