Coursera Getting and Cleaning Data Assignment - Code  Book
==========================================================
Rick Burrows	3/27/2016

This code book describes the creation of a summarized tidy data set containing information from a Human Activity Recognition Using Smartphones    study.  The source of this information is the UCI HAR Dataset downloaded from:

 https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

This process created a tidy data set with the average of each selected measurement variable for each activity and each subject that is in a suitible format for further analysis.

 dataset name:	aggTidy.txt


Origianl UCI Source Information
===============================
==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

About the Experimenta
=====================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals TimeAcc-XYZ and TimeGyro-XYZ. These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (TimeBodyAcc-XYZ and TimeGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (TimeBodyAccJerk-XYZ and TimeBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (TimeBodyAccMag, TimeGravityAccMag, TimeBodyAccJerkMag, TimeBodyGyroMag, TimeBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing FreqBodyAcc-XYZ, FreqBodyAccJerk-XYZ, FreqBodyGyro-XYZ, FreqBodyAccJerkMag, FreqBodyGyroMag, FreqBodyGyroJerkMag. 

These signals were used to estimate variables of the feature vector for each pattern:  
  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.


Codes
======

This datasetis grouped and summarized at the Activity / Subject level and represents the average of measurements for each activity and subject.  A total of 69 variables are provided and described below. 


Code		Value
========================================================================
Activity	( 1 - 6 )
ActivityDesc	(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)		
Subject 	( 1 - 30 , Id of the subject observed in the experiment)

TimeBodyAcc-XYZ
TimeGravityAcc-XYZ
TimeBodyAccJerk-XYZ
TimeBodyGyro-XYZ
TimeBodyGyroJerk-XYZ
TimeBodyAccMag
TimeGravityAccMag
TimeBodyAccJerkMag
TimeBodyGyroMag
TimeBodyGyroJerkMag
FreqBodyAcc-XYZ
FreqBodyAccJerk-XYZ
FreqBodyGyro-XYZ
FreqBodyAccMag
FreqBodyAccJerkMag
FreqBodyGyroMag
FreqBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

	Mean: Mean value
	StDev: Standard deviation

The variable names are constructed as in the following example from the above list and other information:
  (3-axial raw signals are split out in to -X, -Y, -Z respectively)

	TimeBodyAccMean-X
	TimeBodyAccMean-Y
	TimeBodyAccMean-Z

	TimeBodyAccStDev-X
	TimeBodyAccStDev-Y
	TimeBodyAccStDev-Z

	FreqBodyGyroMagMean
	FreqBodyGyroJStDev

Notes: 
======
- Each feature vector is a row on the text file.


License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.
