dataFile <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
dir.create("assignment")
download.file(dataFile, "assignment/UCI-HAR-dataset.zip", method="curl")
unzip("assignment/UCI-HAR-dataset.zip", list=TRUE)

