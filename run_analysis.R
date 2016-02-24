# Getting and Cleaning Data - course project
# This R script called run_analysis.R that does the following.
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable 
#    for each activity and each subject.

# Set working directory to the folder the UCI HAR Dataset is download to.

# load library dplyr for aggregate in step 5
library("dplyr")

# Read the training data set from subject_train, X_train, y_train
subjectTrain <- read.table("train/subject_train.txt", header = FALSE)
xTrain <- read.table("train/X_train.txt", header = FALSE)
yTrain <- read.table("train/y_train.txt", header = FALSE)

# Read the test data set from subject_test, X_test, y_test
subjectTest <- read.table("test/subject_test.txt", header = FALSE)
xTest <- read.table("test/X_test.txt", header = FALSE)
yTest <- read.table("test/y_test.txt", header = FALSE)

# Read activity_labels and features
activities <- read.table("activity_labels.txt", header = FALSE)
features <- read.table("features.txt", header = FALSE)

# Add column names for the data read
colnames(activities) <- c("activityID", "activityName")
colnames(subjectTrain) <- "subjectID"
colnames(subjectTest) <- "subjectID"
# all the 2nd column rows from features contain the column labels
colnames(xTrain) <- features[,2]
colnames(xTest) <- features[,2]
colnames(yTrain) <- "activityID"
colnames(yTest) <- "activityID"

# 1. Merges the training and the test sets to create one data set.
# Merge the training data set
mergedTraining <- cbind(yTrain, subjectTrain, xTrain)

# Merge the test data set
mergedTest <- cbind(yTest, subjectTest, xTest)

# Merge the train and test.
allData <- rbind(mergedTraining,mergedTest)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# Get all necessary column names with mean() and std() for each measurement
requiredColumns <- grep('subject|activity|mean\\(\\)|std\\(\\)',colnames(allData))

# Get necessary column data only
requiredData <- allData[,requiredColumns]

# 3. Uses descriptive activity names to name the activities in the data set.
# Merge requiredData with activity to get description(activityname) of activityID
data <- merge(requiredData,activities, by='activityID', all.x=TRUE )

# 4. Appropriately labels the data set with descriptive variable names.
# source: features_info
names(data) <- gsub("^t", "time", names(data))
names(data) <- gsub("^f", "frequency", names(data))
names(data) <- gsub("Acc", "Accelerometer", names(data))
names(data) <- gsub("Gyro", "Gyroscope", names(data))
names(data) <- gsub("Mag", "Magnitude", names(data))
names(data) <- gsub("BodyBody", "Body", names(data))
names(data) <- gsub("-std\\(\\)", "StdDev", names(data))
names(data) <- gsub("-mean\\(\\)", "Mean", names(data))

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Remove the activity ID before doing the aggregate by activity name and subject ID
tidyData <- data %>% group_by(activityName,subjectID) %>% summarise_each(funs(mean), -activityID)
write.table(tidyData, 'tidyData.txt',row.names=FALSE)
