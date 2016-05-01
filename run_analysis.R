## Getting and Cleaning Data
## Abdullah Moechsin

# Load necessary packages
library(plyr)
#library(dplyr)

# path and filename for reading data
file_labels <- paste(getwd(), "/UCI HAR Dataset/activity_labels.txt", sep = "")

file_features <- paste(getwd(), "/UCI HAR Dataset/features.txt", sep = "")

file_XTest <- paste(getwd(), "/UCI HAR Dataset/test/X_test.txt", sep = "")
file_YTest <- paste(getwd(), "/UCI HAR Dataset/test/y_test.txt", sep = "")
file_SubjectTest <- paste(getwd(), "/UCI HAR Dataset/test/subject_test.txt", sep = "")

file_XTrain <- paste(getwd(), "/UCI HAR Dataset/train/X_train.txt", sep = "")
file_YTrain <- paste(getwd(), "/UCI HAR Dataset/train/y_train.txt", sep = "")
file_SubjectTrain <- paste(getwd(), "/UCI HAR Dataset/train/subject_train.txt", sep = "")

###############################################################################################

# Question 1:
## Merges the training and the test sets to create one data set

###############################################################################################

# Read the Test data and load to respective data frame
tbl_xTest <- read.table(file_XTest)
tbl_yTest <- read.table(file_YTest)
tbl_subjectTest <- read.table(file_SubjectTest)

# Read the Train data and load to respective data frame
tbl_xTrain <- read.table(file_XTrain)
tbl_yTrain <- read.table(file_YTrain)
tbl_subjectTrain <- read.table(file_SubjectTrain)

############################################
# combines both sets of data (Train and Test)
############################################


## for X data
tbl_xdata_combined <- rbind(tbl_xTest, tbl_xTrain)
## for Y data
tbl_ydata_combined <- rbind(tbl_yTest, tbl_yTrain)
# Subject Data
tbl_subject_combined <- rbind(tbl_subjectTest, tbl_subjectTrain)



# Read dimension tables for both activity and features 
tbl_activity_labels <- read.table(file_labels) # 6 unique
tbl_features <- read.table(file_features) # 561 unique


###############################################################################################

# Question 2:
## Extracts only the measurements on the mean and standard deviation 
## for each measurement

###############################################################################################

# Rename columns for table to something understandable 
tbl_activity_labels <- rename(tbl_activity_labels, 
                              c("V1" = "activity_label_code", 
                                "V2" = "activity_label_desc"))

tbl_features <- rename(tbl_features, 
                       c("V1" = "features_code", 
                         "V2" = "features_desc"))

# After loading the dimension table tbl_features
# we need to find all instances of the second column
# for those records with either "mean" or "std"
# store the result in vector called "v_mean_std"

# regex looking for either mean or std and must start with "-"
# to ensure it is formula searched for

v_mean_std <- grep("-(mean|std)", tbl_features$features_desc)

# There were 79 instances of either "mean" or "std" features
# out of possible 561 occurences
# The v_mean_std stores the location instances of these instances
# Need to pass the instances as int to the newly combined 
# "tbl_xdata_combined" to subset the columns we need

tbl_xdata_combined_subset <- tbl_xdata_combined[ ,v_mean_std]

###############################################################################################

# Question 3:
## Uses descriptive activity names to name the activities in the data set

###############################################################################################

# merge both the newly merged Y data table
# with the Activity Label dimension 
# by the Activity Code

tbl_ydata_combined <- 
  merge(tbl_ydata_combined, tbl_activity_labels, by.x = "V1", 
        by.y = "activity_label_code")

# Drop the uneeded column and store in same DF
tbl_ydata_combined <- tbl_ydata_combined["activity_label_desc"]


###############################################################################################

# Question 4:
## Appropriately labels the data set with descriptive variable names

###############################################################################################

# first recall the subset
# rename the columns to those found in v_mean_std 
# from tbl_features

names(tbl_xdata_combined_subset) <- tbl_features[v_mean_std,2]

# Rename the column also from SUbject Combined DF
names(tbl_subject_combined) <- "Subject_desc"

# Now all main data sets are properly labelled
# tbl_xdata_combined_subset
# tbl_ydata_combined
# tbl_subject_combined

# Now Need to combine as single DF 
tbl_combine_all <- cbind(tbl_xdata_combined_subset, tbl_ydata_combined, tbl_subject_combined)

###############################################################################################

# Question 5:
## From the data set in step 4, creates a second, independent tidy data set 
## with the average of each variable for each activity and each subject

###############################################################################################

# There were 79 subset columns in the dataset
# take mean for all 79 columns and store in Tidy_data_set

tidy_data_set <- ddply(tbl_combine_all, .(Subject_desc, activity_label_desc), 
                       function(x) colMeans(x[1:79]))

# Write result to table text output as 
write.table(tidy_data_set, "tidy_data_set.txt", row.name=FALSE)