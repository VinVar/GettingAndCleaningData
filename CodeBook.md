#Getting and Cleaning Data Course Project

#About the Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Selected Tidy Data 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

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

The set of variables that were estimated from these signals for the tidy data are: 

* mean(): Mean value
* std(): Standard deviation

##Units

* Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

* The acceleration signal from the smartphone accelerometer in standard gravity units 'g'. 

* The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

* The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second.

###1. Merges the training and the test sets to create one data set 
* Read the training data set from subject_train, X_train, y_train
* Read the test data set from subject_test, X_test, y_test
* Read activity_labels and features
* Add column names for the data read
* Merge the training data set
* Merge the test data set.
* Merge the train and test.

###2. Extracts only the measurements on the mean and standard deviation for each measurement.
* Get all necessary column names with mean() and std() for each measurement.
* Get necessary column data only.

###3. Uses descriptive activity names to name the activities in the data set
*  Merge required data with activity to get description(activityname) of activityID 
*  Activity Labels: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING 

###4. Appropriately labels the data set with descriptive variable names.
* Variables that begin with 't' is changed to begin with 'time'
* Variables that begin with 'f'is changed to begin with 'frequency'
* Variables that contain 'Acc' is changed to 'Accelerometer'
* Variables that contain 'Gyro' is changed to 'Gyroscope'
* Variables that contain 'Mag' is changed to 'Magnitude'
* Variables that contain 'BodyBody' is changed to 'Body'
* Variables that contain '-std()' is changed to 'StdDev'
* Variables that contain '-mean()' is changed to 'Mean'
 
###5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
*  Do an aggregate by activity name and subject ID
*  data %>% **group_by**(activityName,subjectID) %>% **summarise_each** (funs(mean), -activityID)
