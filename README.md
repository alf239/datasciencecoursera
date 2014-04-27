datasciencecoursera
===================

Data Science track - the initial home task and the homework for "Getting and Cleaning Data"

HW3: An R script called run_analysis.R that does the following: 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive activity names. 
5. Creates a second, independent tidy data set with the average of each variable for 
   each activity and each subject. 

The approach is as follows:

1. Download the dataset if not present (the task is not too clear on whether the data fies 
   are in the subdirectory or not, so it's safer to force the structure by downloading a 
   known set)
2. `rbind` two data files to fullfill requirement 1
3. Take only `std()` and `mean()` features, subset the dataset, thus fulfilling 
   requirement 2; the result is in `mean_and_std`
4. Load the activity labels, and replace indices with names. The approach used was
   adopted from http://stackoverflow.com/questions/22475400/r-replace-values-in-data-frame-using-lookup-table 
   That completes requirement 3.
5. Combines the labels and the data set using `cbind`; doing that for both `mean_and_std` and `X`.
   That closes requirement 4.
6. Using the `X`, calculating an `aggregate` using `mean` for averaging, averaging over 
   `activity` and `subject`; then save the result to a file thus closing requirement 5
 