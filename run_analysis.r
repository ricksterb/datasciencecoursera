#### run_analysis.r ######################################################################################
#
# This script will perform the following tasks against the UCI HAR Dataset downloaded from 
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
#  This process will create a tidy data set suitible for further analysis.
#
# 1. Merge the training and the test sets to create one data set.
# 2. Extract only the measurements on the mean and standard deviation for each measurement. 
# 3. Use descriptive activity names to name the activities in the data set
# 4. Appropriately label the data set with descriptive activity names. 
# 5. Creates final, tidy data set with the average of each variable for each activity and each subject. 
#       Dataset name:  aggTidy.txt
#
##########################################################################################################

## download and unzip the UCI dataset file 

download.file(url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        , destfile = "./Data/GCD/Dataset.zip")
unzip("./Data/GCD/Dataset.zip")                ## creates the UCI HAR Dataset directory and subdirectories

## read all of the necessary files

testX <- read.table("./Data/GCD/UCI HAR Dataset/test/X_test.txt")           ## Test set
testY <- read.table("./Data/GCD/UCI HAR Dataset/test/y_test.txt")           ## Test labels
testS <- read.table("./Data/GCD/UCI HAR Dataset/test/subject_test.txt")     ## Subjects participating     
trainX <- read.table("./Data/GCD/UCI HAR Dataset/train/X_train.txt")        ## Training set  
trainY <- read.table("./Data/GCD/UCI HAR Dataset/train/y_train.txt")        ## Training labels
trainS <- read.table("./Data/GCD/UCI HAR Dataset/train/subject_train.txt")  ## Subjects participating
features <- read.table("./Data/GCD/UCI HAR Dataset/features.txt")           ## All features
actlbl <- read.table("./Data/GCD/UCI HAR Dataset/activity_labels.txt")      ## Activity names

## append the training observations set to the test observations set

allX <- rbind(testX, trainX)

## create a names vector from the features and assign these names to the combined test and train obs. tables

names <- c(as.character(features[,2]))
colnames(allX) <- names

## append the training subjects set to the test subjects set

allS <- rbind(testS, trainS)

## insert the subjects table as the first column of the combined obs. table

allSX <- cbind(allS, allX)

## rename the column brought over from subject(S) set

names(allSX)[names(allSX)=="V1"] <- "Subject"

## append the training labels set to the test labels set

allY <- rbind(testY, trainY)

## insert the labels table as the new first column of the combined obs. table

allYSX <- cbind(allY, allSX)

## rename the column brought over from label(Y) set

names(allYSX)[names(allYSX)=="V1"] <- "Activity"

## create a names vector to use as the selected column names for our eventual result
##  we select only the column names for mean and standard deviation (std) using grep


cols <- c("Activity", "Subject", names(allYSX[grep("mean\\(\\)|std\\(\\)", names(allYSX))]))

## remove dupilicate columns (by name) that are present in the data

noDupsAll <- allYSX[, !duplicated(colnames(allYSX))]

## create a new data frame from the column names provided in cols, thus selecting the columns we want

tidy <- noDupsAll[, names(noDupsAll) %in% cols]

## clean up the column names for readability

names(tidy) <- gsub("^t", "Time", names(tidy))
names(tidy) <- gsub("^f", "Freq", names(tidy))
names(tidy) <- gsub("-mean\\(\\)", "Mean", names(tidy))
names(tidy) <- gsub("-std\\(\\)", "StDev", names(tidy))
names(tidy) <- gsub("BodyBody", "Body", names(tidy))

## create an aggregated data frame that provides the mean for each measurement by  Activity/Subject

aggTidy <- aggregate(tidy, by=list(tidy$Subject, tidy$Activity), FUN=mean, rm.na=TRUE)

## remove 2 columns created by aggregate grouping

aggTidy <- subset(aggTidy , select = -c(Group.1, Group.2))

## assign column names to the Activity labels data frame and merge with the aggTidy result

colnames(actlbl) <- c("Activity", "ActivityDesc")
aggTidy <- merge(actlbl, aggTidy, by="Activity", all.x=TRUE)

## write the result to a text file

write.table(aggTidy,"./Data/GCD/UCI HAR Dataset/aggTidy.txt")

