#### run_analysis.r ######################################################################################
#
# This script will perform the following tasks against the UCI HAR Dataset downloaded from 
# 
#	https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
#  
# This process will create a tidy data set suitible for further analysis.
#       
#	Dataset name: aggTidy.txt   
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates final, tidy data set with the average of each variable for each activity and each subject. 

##########################################################################################################