# Load Required Packages
library(dplyr)

# Define filename
filename <- "Coursera_DS3_Final.zip"

# Download and extract dataset if it does not exist
if (!file.exists(filename)) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method = "curl")
}

if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}

# Load Features and Activity Labels
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("index", "feature_name"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))

# Load Test Data
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$feature_name)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")

# Load Training Data
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$feature_name)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge the training and test datasets
X <- rbind(x_train, x_test)    # Combine feature measurements
Y <- rbind(y_train, y_test)    # Combine activity labels
Subject <- rbind(subject_train, subject_test)  # Combine subject IDs
Merged_Data <- cbind(Subject, Y, X)  # Merge into a single dataset

# Extract only the measurements on the mean and standard deviation for each measurement
TidyData <- Merged_Data %>%
  select(subject, code, contains("mean"), contains("std"))

# Replace activity codes with descriptive activity names
TidyData$code <- activities[TidyData$code, "activity"]

# Rename column 'code' to 'activity'
colnames(TidyData)[2] <- "activity"

# Improve variable names for better readability
colnames(TidyData) <- gsub("Acc", "Accelerometer", colnames(TidyData))
colnames(TidyData) <- gsub("Gyro", "Gyroscope", colnames(TidyData))
colnames(TidyData) <- gsub("BodyBody", "Body", colnames(TidyData))
colnames(TidyData) <- gsub("Mag", "Magnitude", colnames(TidyData))
colnames(TidyData) <- gsub("^t", "Time", colnames(TidyData))
colnames(TidyData) <- gsub("^f", "Frequency", colnames(TidyData))
colnames(TidyData) <- gsub("tBody", "TimeBody", colnames(TidyData))
colnames(TidyData) <- gsub("-mean\\(\\)", "Mean", colnames(TidyData), ignore.case = TRUE)
colnames(TidyData) <- gsub("-std\\(\\)", "STD", colnames(TidyData), ignore.case = TRUE)
colnames(TidyData) <- gsub("-freq\\(\\)", "Frequency", colnames(TidyData), ignore.case = TRUE)
colnames(TidyData) <- gsub("angle", "Angle", colnames(TidyData))
colnames(TidyData) <- gsub("gravity", "Gravity", colnames(TidyData))

# Create a final tidy dataset with the mean and standard deviation for each variable,
# grouped by subject and activity
FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise(across(everything(), list(mean = mean, std = sd), .names = "{.col}_{.fn}"), .groups = "drop")

# Save the final dataset to a file
write.table(FinalData, "FinalData.txt", row.name = FALSE)

# Print message indicating successful completion
message("FinalData.txt has been successfully created.")
