# Source of data for the project:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
# This R script does the following:
# 1. Merges the training and the test sets to create one data set.
# reads and  merges train/X  with test/X
	trainX <- read.table("train/X_train.txt")
	testX <- read.table("test/X_test.txt")
	X <- rbind(trainX, testX)
# reads and  merges train/Y with test/Y
	trainY <- read.table("train/y_train.txt")
	testY <- read.table("test/y_test.txt")
	Y <- rbind(trainY, testY)

# read and  merge train/subject with test/subject
	trainS <- read.table("train/subject_train.txt")
	testS <- read.table("test/subject_test.txt")
	S <- rbind(trainS, testS)



# reads “features.txt” file
features <- read.table("features.txt")
#assign meaningfull column names from extracted features$V2
# get rid of ()  in mean and std in features V2

indices_of_tidy_features <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
#2.Extract only the measurements on the mean and standard  #deviation for each measurement
X <- X[, indices_of_tidy_features]
names(X) <- features[indices_of_tidy_features, 2]
#get rid of() in X column names.
names(X) <- gsub("\\(|\\)", "", names(X))
#change  X column names into lower case.
names(X) <- tolower(names(X))  

# 3. Uses descriptive activity names to name the activities in #the data set

activities <- read.table("activity_labels.txt")
#get rid of (“-”) in activities V2 and change it to lower case.
activities[, 2] = gsub("_", "", tolower(as.character(activities[, 2])))
Y[,1] = activities[Y[,1], 2]
names(Y) <- "activity"

# 4. Appropriately labels the data set with descriptive activity names.

names(S) <- "subject"
tidy <- cbind(S, Y, X)
write.table(tidy, "merged_tidy_data.txt")

# 5. Creates a 2nd, independent tidy data set with the average of #each variable for each activity and each subject.

uniqueS = unique(S)[,1]
numS = length(unique(S)[,1])
numActivities = length(activities[,1])
numCols = dim(tidy)[2]
result = tidy[1:(numS*numActivities), ]

row = 1
for (s in 1:numS) {
	for (a in 1:numActivities) {
		result[row, 1] = uniqueS[s]
		result[row, 2] = activities[a, 2]
		tmp <- tidy[tidy$subject==s & tidy						$activity==activities[a, 2], ]
		result[row, 3:numCols] <- colMeans(tmp[, 3:numCols])
		row = row+1
	}
}
write.table(result, "data_set_with_the_averages.txt")

# result2 <- read.table("data_set_with_the_averages.txt")
