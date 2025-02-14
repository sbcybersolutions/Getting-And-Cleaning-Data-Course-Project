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
Once the dataset was downloaded each of the following files were read into separate dataframes:
<ul>
  <li><code>features.txt</code></li>
  <li><code>activity_labels.txt</code></li>
  <li><code>subject_test</code></li>
  <li><code>x_test.txt</code></li>
  <li><code>y_test</code></li>
  <li><code>subject_train</code></li>
  <li><code>x_train</code></li>
  <li><code>y_train</code></li>
</ul>

Then the datasets were merged.  <b>rbind</b> was used to merge the X, Y, and Subject test & train data sets. Then <b>cbind</b> was used to merge all three into a single dataset called <b>Merged_Data</b>.

From there, the Mean and Standard Deviation was extracted for each measurement selecting only columns <code>subject</code> and <code>code</code> and creating a new dataframe called <code>TidyData</code> that contained the <b>Mean</b> and <b>Standard Deviation</b> for each measurement.

Data was then labled with descriptive names:
<ul>
  <li>Code was renamed to activities</li>
  <li>Acc -> Accelerometer</li>
  <li>Gyro -> Gyroscope</li>
  <li>BodyBody -> Body</li>
  <li>Mag -> Magnitude</li>
  <li>f -> Frequency</li>
  <li>t -> time</li>
</ul>

Finally, the new tidy data set <code>FinalData</code> was created by grouping <b>subject</b> and <b>activity</b>, and providing the <b>mean</b> and <b>standard deviation</b> for each entry.

<code>FinalData.txt</code> is the tidy data output file.
