##########################################
# Getting and Cleaning Data Course Project
##########################################

# Download, unzip and read data file

fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./Dataset.zip")
unzip("./Dataset.zip", list = T) # list files without extracting
unzip("./Dataset.zip") # unzip files

# Import data
