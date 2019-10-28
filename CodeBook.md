# Codebook

## Data source variables

* Original experiment description
    * [Human Activity Recognition Using Smartphones Experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* Dataset is available at :
    * [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip )

Original data and experiment description
> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

**Aim of our analysis is to tidy data, only focusing on mean and standard deviation measurements**

## Study design : Data collecting process, transformations

First, data are retrieved from [Human Activity Recognition Using Smartphones Data Set](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

Original dataset is split into 2 distinct datasets (one for training (70% of original data), the other for testing (30% remaining))

The process consists in:

* Getting data
    * First of all
        * 'y_train.txt' and 'y_test.txt' : Performed and measured activities
            * Single column .txt file
        * 'subject_train.txt' and 'subject_test.txt' : Individuals participating in tests (represented by a number)
            * Single column .txt file
        * 'features.txt' : Names of measurements
            * Single column .txt file 
        * 'X_train.txt' and 'X_test.txt' : Measurements
            * 561-column .txt file
* Merging dataset
    * Training and Test datasets are merged
    * **At this step, 2 data frames are merged into a single one**
* Only keeping mean and standard deviation
    * Column names are filtered so as to contain only measurements corresponding to mean and standard deviation 
* Importing table hat matches 'activity' IDs to the names of measurements
    * The first column of this data frame is named 'activity_ID' to match the column from the full data frame. This         allows 'activity_ID' to be used as a primary key to merge the two data frames
        * Factor levels: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"
* Labelize all features
    * All 86 features are labelized for easy understanding of data
* **Generate final tidydata**
    * **Grouped by subject and activity**
    * **Get average values for each mean and standard deviation measurements**

**For step by step and scripts description, please consult our README.md file**

## CodeBook : Tidy dataset description - Features

### Tidydata

The 'run_data_summary' data set is a text file (generated through write.table() function with row.name = FALSE)

* Filename: 'run_data_summary.txt'
    * File contains header
    * ';' separated file
    * '"' quote charater
* Columns : 89 variables - subject, activity, activity_ID, and all 86 mean or standard deviation for each measurement
* Rows : 180 observations (plus header line)

For each record it is provided:

- An identifier of the subject who carried out the experiment.
    +Integer
- The activity name:
    *WALKING
    *WAKING_UPSTAIRS
    *WALKING_DOWNSTAIRS
    *SITTING
    *STANDNG
    *LAYING
- The average of each meassurament for each subject and each activity
    +Numeric

### Features

* 'activity_ID'
    * Measured activity ID tag
    * Field does not contain real name but an Id tag
        * Its range is from 1 to 6
    * Type : integer
    * Unit : NA, identifier
* 'activity_name'
    * Measured activity name
    * Type : Factor
    * Factor levels:
        * "WALKING"
        * "WALKING_UPSTAIRS"
        * "WALKING_DOWNSTAIRS"
        * "SITTING"
        * "STANDING"
        * "LAYING"
    * Unit : String factor
* 'subject_ID'
    * Subject (individual) participating to study.
    * Field does not contain real name but an Id tag
        * Its range is from 1 to 30
    * Type : integer
    * Unit : NA, identifier
* 'tBodyAcc_mean_X'
    * Body Acceleration mean - X axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAcc_mean_Y'
    * Body Acceleration mean - Y axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAcc_mean_Z'
    * Body Acceleration mean - Z axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAcc_std_X'
    * Body acceleration standard deviation - X axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAcc_std_Y'
    * Body acceleration standard deviation - Y axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAcc_std_Z'
    * Body acceleration standard deviation - Z axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_mean_X'
    * Gravity acceleration mean - X axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_mean_Y'
    * Gravity acceleration mean - Y axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_mean_Z'
    * Gravity acceleration mean - Z axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_std_X'
    * Gravity acceleration standard deviation - X axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_std_Y'
    * Gravity acceleration standard deviation - Y axis
    * Unit : 'g' gravity, acceleration
* 'tGravityAcc_std_Z'
    * Gravity acceleration standard deviation - Z axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_mean_X'
    * Body acceleration jerk mean - X axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_mean_Y'
    * Body acceleration jerk mean - Y axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_mean_Z'
    * Body acceleration jerk mean - Z axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_std_X'
    * Body acceleration jerk standard deviation - X axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_std_Y'
    * Body acceleration jerk standard deviation - Y axis
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerk_std_Z'
    * Body acceleration jerk standard deviation - Z axis
    * Unit : 'g' gravity, acceleration
* 'tBodyGyro_mean_X'
    * Body gyro (angular velocity vector) mean - X axis
    * Unit : radians/second
* 'tBodyGyro_mean_Y'
    * Body gyro (angular velocity vector) mean - Y axis
    * Unit : radians/second
* 'tBodyGyro_mean_Z'
    * Body gyro (angular velocity vector) mean - Z axis
    * Unit : radians/second
* 'tBodyGyro_std_X'
    * Body gyro (angular velocity vector) standard deviation - X axis
    * Unit : radians/second
* 'tBodyGyro_std_Y'
    * Body gyro (angular velocity vector) standard deviation - Y axis
    * Unit : radians/second
* 'tBodyGyro_std_Z'
    * Body gyro (angular velocity vector) standard deviation - Z axis
    * Unit : radians/second
* 'tBodyGyroJerk_mean_X'
    * Body gyro (angular velocity vector) jerk mean - X axis
    * Unit : radians/second
* 'tBodyGyroJerk_mean_Y'
    * Body gyro (angular velocity vector) jerk mean - Y axis
    * Unit : radians/second
* 'tBodyGyroJerk_mean_Z'
    * Body gyro (angular velocity vector) jerk mean - Z axis
    * Unit : radians/second
* 'tBodyGyroJerk_std_X'
    * Body gyro (angular velocity vector) jerk standard deviation - X axis
    * Unit : radians/second
* 'tBodyGyroJerk_std_Y'
    * Body gyro (angular velocity vector) jerk standard deviation - Y axis
    * Unit : radians/second
* 'tBodyGyroJerk_std_Z'
    * Body gyro (angular velocity vector) jerk standard deviation - Z axis
    * Unit : radians/second
* 'tBodyAccMag_mean'
    * Body acceleration magnitude mean
    * Unit : 'g' gravity, acceleration
* 'tBodyAccMag_std'
    * Body acceleration magnitude standard deviation
    * Unit : 'g' gravity, acceleration
* 'tGravityAccMag_mean'
    * Gravity acceleration magnitude mean
    * Unit : 'g' gravity, acceleration
* 'tGravityAccMag_std'
    * Gravity acceleration magnitude standard deviation
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerkMag_mean'
    * Body acceleration magnitude jerk mean
    * Unit : 'g' gravity, acceleration
* 'tBodyAccJerkMag_std'
    * Body acceleration magnitude jerk standard deviation
    * Unit : 'g' gravity, acceleration
* 'tBodyGyroMag_mean'
    * Body gyro (angular velocity vector) magnitude mean
    * Unit : radians/second
* 'tBodyGyroMag_std'
    * Body gyro (angular velocity vector) magnitude standard deviation
    * Unit : radians/second
* 'tBodyGyroJerkMag_mean'
    * Body gyro (angular velocity vector) jerk magnitude mean
    * Unit : radians/second
* 'tBodyGyroJerkMag_std'
    * Body gyro (angular velocity vector) jerk magnitude standard deviation
    * Unit : radians/second
* 'fBodyAcc_mean_X'
    * Body acceleration mean - X axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_mean_Y'
    * Body acceleration mean - Y axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_mean_Z'
    * Body acceleration mean - Z axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_std_X'
    * Body acceleration standard deviation - X axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_std_Y'
    * Body acceleration standard deviation - Y axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_std_Z'
    * Body acceleration standard deviation - Z axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_meanFreq_X'
    * Body acceleration jerk mean - X axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_meanFreq_Y'
    * Body acceleration jerk mean - Y axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAcc_meanFreq_Z'
    * Body acceleration jerk mean - Z axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerk_mean_X'
    * Body acceleration jerk standard deviation - X axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerk_mean_Y'
    * Body acceleration jerk standard deviation - Y axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerk_mean_Z'
    * Body acceleration jerk standard deviation - Z axis
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerk_std_X'
    * Body gyro (angular velocity vector) mean - X axis
    * Unit : radians/second
* 'fBodyAccJerk_std_Y'
    * Body gyro (angular velocity vector) mean - Y axis
    * Unit : radians/second
* 'fBodyGyro_mean_Z'
    * Body gyro (angular velocity vector) mean - Z axis
    * Unit : radians/second
* 'fBodyGyro_std_X'
    * Body gyro (angular velocity vector) standard deviation - X axis
    * Unit : radians/second
* 'fBodyGyro_std_Y'
    * Body gyro (angular velocity vector) standard deviation - Y axis
    * Unit : radians/second
* 'fBodyGyro_std_Z'
    * Body gyro (angular velocity vector) standard deviation - Z axis
    * Unit : radians/second
* 'fBodyGyro_meanFreq_X'
    * Body gyro (angular velocity vector) mean frequency - X axis
    * Unit : radians/second
* 'fBodyGyro_meanFreq_Y'
    * Body gyro (angular velocity vector) mean frequency - Y axis
    * Unit : radians/second 
* 'fBodyGyro_meanFreq_Z'
    * Body gyro (angular velocity vector) mean frequency - Z axis
    * Unit : radians/second    
* 'fBodyAccMag_mean'
    * Body body accelation magnitude mean
    * Unit : 'g' gravity, acceleration
* 'fBodyAccMag_std'
    * Body body accelation magnitude standard deviation
    * Unit : 'g' gravity, acceleration
* 'fBodyAccMag_meanFreq'
    * Body body accelation magnitude mean frequency
    * Unit : 'g' gravity, acceleration    
* 'fBodyAccJerkMag_mean'
    * Body body accelation jerk magnitude mean
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerkMag_std'
    * Body body accelation jerk magnitude standard deviation
    * Unit : 'g' gravity, acceleration
* 'fBodyAccJerkMag_meanFreq'
    * Body body accelation jerk magnitude mean frequency
    * Unit : 'g' gravity, acceleration
* 'fBodyGyroMag_mean'
    * Body body gyro (angular velocity vector) magnitude mean
    * Unit : radians/second
* 'fBodyGyroMag_std'
    * Body body gyro (angular velocity vector) magnitude standard deviation
    * Unit : radians/second
* 'fBodyGyroMag_meanFreq'
    * Body body gyro (angular velocity vector) magnitude mean frequency
    * Unit : radians/second    
* 'fBodyGyroJerkMag_mean'
    * Body body gyro (angular velocity vector) jerk magnitude mean
    * Unit : radians/second
* 'fBodyGyroJerkMag_std'
    * Body body gyro (angular velocity vector) jerk magnitude standard deviation
    * Unit : radians/second
* 'fBodyGyroJerkMag_meanFreq'
    * Body body gyro (angular velocity vector) jerk magnitude mean frequency
    * Unit : radians/second
* 'angle_tBodyAccMean_gravity'
    * Angle between vectors
* 'angle_tBodyAccJerkMean__gravityMean'
    * Angle between vectors
* 'angle_tBodyGyroMean_gravityMean'
    * Angle between vectors
* 'angle_tBodyGyroJerkMean_gravityMean'
    * Angle between vectors
* 'angle_X_gravityMean'
    * Angle between vectors
* 'angle_Y_gravityMean'
    * Angle between vectors
* 'angle_Z_gravityMean
    * Angle between vectors
