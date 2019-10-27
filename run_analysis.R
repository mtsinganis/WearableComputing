###########################################
## Getting and Cleaning Data Course Project
###########################################

# Load 'here' package. The project's root directory is assigned in the beginning so that
# all file paths can be specified relative to that root directory. This allows one to
# share the script in such a way that it can be run on any user's machine without having
# to edit the file paths

if (!require('here')) install.packages('here'); library('here')
set_here()

# Download and unzip project's data
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url, destfile = here("Dataset.zip")) # download data
unzip(here("Dataset.zip")) # unzip files

# Read the 'activity' labels
train_ID <- read.table(here("UCI HAR Dataset", "train", "y_train.txt"))
test_ID <- read.table(here("UCI HAR Dataset", "test", "y_test.txt"))

# Read the 'subject IDs'
subject_ID_train <- read.table(here("UCI HAR Dataset", "train", "subject_train.txt"))
subject_ID_test <- read.table(here("UCI HAR Dataset", "test", "subject_test.txt"))

# Read the 'features' data set. The first column contains the code and the second one the
# name of the features. They are correspondingly named "feature_number" and "feature_name"
features <- read.table(here("UCI HAR Dataset", "features.txt"))
names(features) <- c("feature_number", "feature_name")

# Read 'train' and 'test' data sets
train <- read.table(here("UCI HAR Dataset", "train", "X_train.txt"))
test <- read.table(here("UCI HAR Dataset", "test", "X_test.txt"))



#################################################################
## 1. Merge the training and the test sets to create one data set

# Merge 'train' and 'test' data frames
train_and_test <- rbind(train, test)



###################################################################################
## 2. Extract only measurements on mean and standard deviation for each measurement

# Rename columns (V1, V2, etc.) with names from features data set (e.g. tBodyAcc-mean()-X)
train_and_test <- setNames(train_and_test, features$feature_name)

# Find columns containing 'mean' or 'std' measurements & store them in vector 'my_filter'
my_filter <- grep("[Mm]ean|std", names(train_and_test))

# Subset main data set by 'my_filter' to keep variables referring to means and stds
train_and_test <- train_and_test[,my_filter]



###########################################################################
## 3. Use descriptive activity names to name the activities in the data set

# Merge the 'subject_ID' data sets from the training and test sets and name column
subject_ID <- rbind(subject_ID_train, subject_ID_test)
names(subject_ID) <- "subject_ID"

# Merge the 'activity_ID' labels from the training and test sets and name column
activity_ID <- rbind(train_ID, test_ID)
names(activity_ID) <- "activity_ID"

## At this stage the 'train_and_test' data set is merged with the 'subject_ID' and 
## 'activity_ID' tables which will be needed to fulfill the 3rd and 4th requirements
## of the run_analysis.R script

# Merge all data frames into one object (by column)
All <- cbind(subject_ID, activity_ID, train_and_test)

# Read table that matches 'activity' IDs to 'activity' names. The first column of this
# data frame is named 'activity_ID' to match the column from the 'All' data frame. This
# allows one to use 'activity_ID' as a primary key to merge these two data frames.
activity <- read.table(here("UCI HAR Dataset", "activity_labels.txt"),
                       col.names = c("activity_ID","activity_name"))

# Convert all 'activity_name' levels to lower case to increase readability. The activity
# names ('walking', 'walking_upstairs' etc.) do not require any additional changes beyond 
# that since they describe the activities in a clear, sensible way
activity$activity_name <- tolower(activity$activity_name)

# Merge the 'activity' table with the main dataset ('All')
All <- merge(activity, All, by = "activity_ID", all = TRUE)



#####################################################################
## 4.Appropriately label the data set with descriptive variable names

# Replace hyphens '-' with underscores '_' to keep the variable name formatting
# consistent and readable
colnames(All) <- gsub("-", "_", colnames(All))

# Replace commas with underscores
colnames(All) <- gsub(",", "_", colnames(All))

# Remove parentheses '()'
colnames(All) <- gsub("\\()", "", colnames(All))

# Remove parentheses at the end of the variable names
colnames(All) <- gsub("\\)$", "", colnames(All))

# Replace remaining parentheses in "angle(tBodyAccJerkMean),gravityMean" etc. with "_"
colnames(All) <- gsub("\\(|\\)", "_", colnames(All))

# Remove repeats of 'Body'
colnames(All) <- gsub("BodyBody", "Body", colnames(All))



######################################################################################
## 5. From the data set in step 4, create a second, independent tidy data set with the
##    average of each variable for each activity and each subject.

if (!require('dplyr')) install.packages('dplyr'); library('dplyr')

# Convert 'All' to tibble
All <- tbl_df(All)

# Group 'All' by activity and subject and calculate average of each variable by groups.
# The result is saved in a new tibble which can then be exported
All_average <- All %>%
    group_by(activity_name, subject_ID) %>%
    summarize_each(list(mean = mean))

# Export 'All_average' as .txt table that can be uploaded during assignment submission
write.table(All_average, file = "run_data_summary.txt", row.name = FALSE)
