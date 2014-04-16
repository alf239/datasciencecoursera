#  You should create one R script called run_analysis.R that does the following. 

dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create("assignment")
download.file(dataFile, "assignment/UCI-HAR-dataset.zip", method="curl")
unzip("assignment/UCI-HAR-dataset.zip", list=TRUE)

# 1. Merges the training and the test sets to create one data set.
features <- read.table("./UCI HAR Dataset/features.txt")

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
X <- rbind(X_test, X_train)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
interestingFeatures <- features[grep("(mean|std)\\(", features[,2]),]
mean_and_std <- X[,interestingFeatures[,1]]
names(mean_and_std) <- interestingFeatures[,2]

# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive activity names. 

# 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# see https://gist.github.com/dfalster/5589956 for a cool approach to lookup tables

