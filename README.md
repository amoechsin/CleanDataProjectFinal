### Introduction

This is the final assignment for "Getting and Cleaning Data". 
Honestly, when I first downloaded all data sets and read the instructions, 
it was unclear what was expected from the assignment. Several attempts on my own at looking at the data
as well as lurking around in the forums gave me a good idea of the assignment.
The assignment itself was not too complicated, just understanding what was needed to be done was a bit tricky.

This README will attempt to give a step by step instruction what was done based on the question number.

### Question 1: Merges the training and the test sets to create one data set

First thing that was done, made variable names for all files and locations of said file for 
all data sets - Train and Test (for both X and Y vals) as well as the subject matter.

Once we have the names, we use them to read data to newly data frame.
1. Read the Test data and load to respective data frame (X, Y, Subject) 
2. Read the Train data and load to respective data frame (X, Y, Subject)

Altogether 6 Data frames are loaded. Also, we add the data frames for the "Activity Labels"
as well as the "Features" details. We note Features has 561 elements while the each observation in 
the "X" data frames has same number. This will be joined to identify the type being measured.

When this is all done, we combine both sets of data (Train and Test) by it's X and Y values and store
to new combined data frmaes. 

### Question 2: Extracts only the measurements on the mean and standard deviation for each measurement

We have loaded the dimension data frames for Activity Labels as well as Features, we rename the columns from
V1/V2 to a unique and understandable column name. 
After loading the dimension table tbl_features, we need to find all instances of the second column
for those records with either "mean" or "std" and store the result in a new vector called "v_mean_std"

Using regular expression we look for either mean or std and must start with "-" to ensure it is formula searched for.

There were 79 instances of either "mean" or "std" features out of possible 561 occurences
The v_mean_std stores the location instances of these instances. Now we need to pass the instances as int to the newly combined 
"tbl_xdata_combined" to subset the columns we need

### Question 3: Uses descriptive activity names to name the activities in the data set

In this part, I merge both the newly merged Y data table with the Activity Label dimension 
by the Activity Code. The we drop the Code field and store to same DF.

### Question 4: Appropriately labels the data set with descriptive variable names

First recall the subset and rename the columns to those found in v_mean_std from tbl_features
Once done, we rename the column also from Subject Combined DF.

Now all main data sets are properly labelled:
 1. tbl_xdata_combined_subset
 2. tbl_ydata_combined
 3. tbl_subject_combined
 
 We then proceed to combine to single data frame

### Question 5:From the data set in step 4, creates a second, independent tidy data set 
	with the average of each variable for each activity and each subject

There were 79 subset columns in the dataset, take mean for all 79 columns and store in Tidy_data_set.

The we write the output in text file.