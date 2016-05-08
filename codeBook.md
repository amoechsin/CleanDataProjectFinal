### Codebook

This codebook tells will describe the data and preparation on tidying the data set for final analysis to output the Tidy Data set

## Datasets used

* Description of the dataset to be used: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

* Dataset location: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Data Information

Following files are used:
* X_train.txt (All 561 data for every activity for train dataset - 7352)
* Y_train.txt (Key for activity for all 7352 records)
* X_test.txt (All 561 measures for every activity for test dataset - 2947)
* Y_test.txt (Key for activity for all 2947 records)
* subject_test.txt
* subject_train.txt
* features.txt (labels for all 561 measures)
* activity_labels.txt (labels for all 6 types of activity)

## Analysis Objective 

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Tidy Data set field output

1 Subject_desc - Subject ID
2 activity_label_desc - Activity Label (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
3 tBodyAcc-mean()-X
4 tBodyAcc-mean()-Y
5 tBodyAcc-mean()-Z
6 tBodyAcc-std()-X
7 tBodyAcc-std()-Y
8 tBodyAcc-std()-Z
9 tGravityAcc-mean()-X
10tGravityAcc-mean()-Y
11tGravityAcc-mean()-Z
12tGravityAcc-std()-X
13tGravityAcc-std()-Y
14tGravityAcc-std()-Z
15tBodyAccJerk-mean()-X
16tBodyAccJerk-mean()-Y
17tBodyAccJerk-mean()-Z
18tBodyAccJerk-std()-X
19tBodyAccJerk-std()-Y
20tBodyAccJerk-std()-Z
21tBodyGyro-mean()-X
22tBodyGyro-mean()-Y
23tBodyGyro-mean()-Z
24tBodyGyro-std()-X
25tBodyGyro-std()-Y
26tBodyGyro-std()-Z
27tBodyGyroJerk-mean()-X
28tBodyGyroJerk-mean()-Y
29tBodyGyroJerk-mean()-Z
30tBodyGyroJerk-std()-X
31tBodyGyroJerk-std()-Y
32tBodyGyroJerk-std()-Z
33tBodyAccMag-mean()
34tBodyAccMag-std()
35tGravityAccMag-mean()
36tGravityAccMag-std()
37tBodyAccJerkMag-mean()
38tBodyAccJerkMag-std()
39tBodyGyroMag-mean()
40tBodyGyroMag-std()
41tBodyGyroJerkMag-mean()
42tBodyGyroJerkMag-std()
43fBodyAcc-mean()-X
44fBodyAcc-mean()-Y
45fBodyAcc-mean()-Z
46fBodyAcc-std()-X
47fBodyAcc-std()-Y
48fBodyAcc-std()-Z
49fBodyAcc-meanFreq()-X
50fBodyAcc-meanFreq()-Y
51fBodyAcc-meanFreq()-Z
52fBodyAccJerk-mean()-X
53fBodyAccJerk-mean()-Y
54fBodyAccJerk-mean()-Z
55fBodyAccJerk-std()-X
56fBodyAccJerk-std()-Y
57fBodyAccJerk-std()-Z
58fBodyAccJerk-meanFreq()-X
59fBodyAccJerk-meanFreq()-Y
60fBodyAccJerk-meanFreq()-Z
61fBodyGyro-mean()-X
62fBodyGyro-mean()-Y
63fBodyGyro-mean()-Z
64fBodyGyro-std()-X
65fBodyGyro-std()-Y
66fBodyGyro-std()-Z
67fBodyGyro-meanFreq()-X
68fBodyGyro-meanFreq()-Y
69fBodyGyro-meanFreq()-Z
70fBodyAccMag-mean()
71fBodyAccMag-std()
72fBodyAccMag-meanFreq()
73fBodyBodyAccJerkMag-mean()
74fBodyBodyAccJerkMag-std()
75fBodyBodyAccJerkMag-meanFreq()
76fBodyBodyGyroMag-mean()
77fBodyBodyGyroMag-std()
78fBodyBodyGyroMag-meanFreq()
79fBodyBodyGyroJerkMag-mean()
80fBodyBodyGyroJerkMag-std()
81fBodyBodyGyroJerkMag-meanFreq()