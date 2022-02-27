Getting and Cleaning Data Course Project (Coursera)

Description

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

You should create one R script called run_analysis.R that does the following:

.Merges the training and the test sets to create one data set.

.Extracts only the measurements on the mean and standard deviation for each measurement.

.Uses descriptive activity names to name the activities in the data set

.Appropriately labels the data set with descriptive variable names.

.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

This repository contains:

1.CodeBook.md: information about raw and tidy data set

2. FinalData.txt (tidy data)

3.run_analysis.R: R script to convert raw data into a tidy data

The R script run_analysis.R :

1.Checks preexisting files, if don't exist, it downloads the dataset into the working directory

2.Loads information 

3.Loads both the training and test datasets, keeping only columns which reflect  mean or standard deviation

4.Loads the activity and subject data for each dataset, and merges columns with the dataset

5.Merges the two datasets

6.Converts the activity and subject columns into factors

7.Creates a tidy dataset that consists of the average (mean) value of each variable for each subject and activity pair.

The end result is saved into  "FinalData.txt"
