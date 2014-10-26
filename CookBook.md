 The cook book

The dataset is based on data from [1], downloaded from here
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
1.Merges the training and the test sets to create one data set.

 The test sets were merged to create one data set
test\X_test.txt, test\y_test.txt, test\subject_test.txt were merged into test data table
 The training sets were merged to create one data set
test\X_train.txt, test\y_train.txt, test\subject_train.txt were merged into train data table 

2.Extracts only the measurements on the mean and standard deviation for each measurement. 
Only the measurements on the mean and standard deviation for each measurement were extracted from
both training and test data tables and combined into a single table (also including columns with
corresponding subject ids and activity labels).

3.Uses descriptive activity names to name the activities in the data set
Each activity label was replaced with corresponding activity name from activity_labels.txt.

4.Appropriately labels the data set with descriptive variable names. 
Each column names  was replaced with meaningfull names from features.txt column 2. 
 Features  cleaned from special charecters such as () , “-” and changed to lower case to make it easy to read.
 
5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for
each activity and each subject.
A second, data set with the average of each variable for each activity and each subject was created. 
The rows were reodered so that activities performed by each subject are in adjacent rows.
Two files for tidy data created:
(data_set_with_the_averages)and (merged_tidy_data)

Column names:
Names of cuolumn names are same as in features.txt but the values are averages of each variable for each
activity and each subject.
Subject:  range of values [1:30] .. id of a subject performing ther activity
Activity:  Name of activity performed
Rest of the columns corespond to averaged variables describing mean/std measurements. 
tGravityAcc-mean()-X , tGravityAcc-mean()-Y , tGravityAcc-mean()-Z , tGravityAcc-std()-X ,
tGravityAcc-std()-Y tGravityAcc-std()-Z



[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz.
Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine.
International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
