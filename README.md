Introduction
=============

This repository contains a data analysis script (run_analysis.R) that computes mean of the data collected from the accelerometers from the Samsung Galaxy S smartphone. It computes for both the training and test data set. The mean is computed for all the standard deviation and mean variables grouped by subject and activity name. 

Refer the code book CodeBook.md for details on the variable list in the output data set 

Input data
===========
A full description of the input data is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

and the input  data for the project can be obtained at the following link
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 


Script - run_analysis.R
========================
The script performs the following steps
- Downloads and extracts the input data. 
- reads the training and test data
- reads the column names and extracts the column that have the mean and standard deviation
- Merges the training and the test sets to create one data set.
- Extracts only the measurements on the mean and standard deviation for each measurement. 
- Reads the train/test activity names and uses descriptive activity names to name the activities 
- Reads the train/test subjects 
- merges the activity and subject data to the data set
- computes the average of each variable for each activity and each subject.
- writes the data set to a file
