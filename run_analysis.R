#  You should create one R script called run_analysis.R that does the following. 

if (!file.info("UCI HAR Dataset")$isdir) {
        dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        dir.create("assignment")
        download.file(dataFile, "assignment/UCI-HAR-dataset.zip", method="curl")
        unzip("assignment/UCI-HAR-dataset.zip")
}

# 1. Merges the training and the test sets to create one data set.
features <- read.table("./UCI HAR Dataset/features.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", col.names=features[,2])
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", col.names=features[,2])
X <- rbind(X_test, X_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
interestingFeatures <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- X[,interestingFeatures[,1]]

# 3. Uses descriptive activity names to name the activities in the data set
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names = c('activity'))
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names = c('activity'))
y <- rbind(y_test, y_train)

labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
for (i in 1:nrow(labels)) {
        code <- as.numeric(labels[i, 1])
        name <- as.character(labels[i, 2])
        y[y$activity == code, ] <- name
}

# 4. Appropriately labels the data set with descriptive activity names. 
X <- cbind(y, X)
final_result <- cbind(y, mean_and_std)

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
averages <- aggregate(X[,2:length(X)], by = list(activity = X$activity), mean)

write.csv(averages, file='assignment/result.txt', row.names=FALSE)
