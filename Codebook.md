# Codebook
Author: Christian Salafia

Date: 14 February 2025

# Getting and Cleaning Data Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. 

The goal is to prepare tidy data that can be used for later analysis. 

You will be graded by your peers on a series of yes/no questions related to the project. 

You will be required to submit: 
<ol>
  <li>A tidy data set as described below</li>
  <li>A link to a Github repository with your script for performing the analysis</li>
  <li>A code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md.</li>
</ol>

You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

## Student Requirements
The student should create one R script called <code>run_analysis.R</code> that does the following:
<ul>
  <li>Merges the training and test datasets to create a single data set.</li>
  <li>Extract only the measurements on the mean and standard deviation for each measurement.</li>
  <li>Use appropriate descriptive activity names to name the activities in the dataset.</li>
  <li>Appropriately labels the data set with descriptive variable names.</li>
  <li>From the data set in Step 4, create a second, independent tidy data set with the average for each activity and each subject.</li>
</ul>

## Methodology
After downloading the dataset, all of the data frames were assigned.

<code>
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")
</code>
