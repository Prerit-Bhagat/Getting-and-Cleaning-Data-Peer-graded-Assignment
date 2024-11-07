# Codebook for Getting and Cleaning Data - Peer Assessment Project

## Dataset Overview

The dataset consists of data collected from the accelerometers of a Samsung Galaxy S smartphone. The data represents various activities of subjects that were recorded and used for the project. The goal of this project is to clean and prepare the data for analysis.

## Data Files

The dataset used in this project contains several text files, which are divided into training and testing data sets. These data sets are merged to form a single dataset, which is then cleaned and processed.

### Files in the dataset:

- **`X_train.txt`**: Contains the training set with features (measurements of various sensor readings).
- **`y_train.txt`**: Contains the activity labels corresponding to the training set.
- **`subject_train.txt`**: Contains the subject IDs for the training data.
- **`X_test.txt`**: Contains the test set with features.
- **`y_test.txt`**: Contains the activity labels corresponding to the test set.
- **`subject_test.txt`**: Contains the subject IDs for the test data.
- **`features.txt`**: Lists the names of the 561 features in the dataset.
- **`activity_labels.txt`**: Provides the mapping between activity IDs and activity names.

## Variables in the Final Tidy Dataset

### Subject Variables

- **`subjectId`**: The ID of the subject performing the activity (an integer value). There are 30 unique subjects in the dataset.

### Activity Variables

- **`activityId`**: The activity ID (an integer value), ranging from 1 to 6, representing different activities as defined in the `activity_labels.txt` file.
- **`activityType`**: Descriptive activity name (e.g., WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). This variable was merged from the `activity_labels` dataset based on `activityId`.

### Feature Variables

The features consist of 561 measurements taken from the smartphone’s accelerometers and gyroscope. These measurements represent different statistical summaries of the sensor data for each time window.

The following transformations were applied to the original dataset:

- **Only mean and standard deviation features are retained**: The dataset was filtered to retain only the variables that represent the mean or standard deviation of the measurements (i.e., columns with "mean()" or "std()" in their names).
- **Descriptive variable names**: The feature column names were cleaned and standardized to remove any special characters and to make them more descriptive (e.g., `tBodyAcc-mean-X` represents the mean of the body acceleration in the X direction).

The dataset includes columns such as:
- **`tBodyAcc-mean-X`**: The mean of the body accelerometer measurements in the X direction.
- **`tBodyAcc-mean-Y`**: The mean of the body accelerometer measurements in the Y direction.
- **`tBodyAcc-mean-Z`**: The mean of the body accelerometer measurements in the Z direction.
- **`tGravityAcc-std-X`**: The standard deviation of the gravity accelerometer measurements in the X direction.
- (And many other features representing various sensor measurements.)

## Dataset Transformations

1. **Merging the Training and Test Sets**: The training and test datasets were merged to form a single dataset (`setAllInOne`). This dataset includes all features, subject IDs, and activity IDs for both training and test data.

2. **Extracting Mean and Standard Deviation**: From the merged dataset, only the columns related to the mean and standard deviation were extracted.

3. **Labeling Activities**: The `activityId` was replaced with descriptive activity names by merging the dataset with the `activity_labels.txt` file.

4. **Descriptive Variable Names**: The column names were made more descriptive by replacing abbreviations (e.g., `t` for time, `f` for frequency) with full terms and removing special characters.

5. **Creating a Tidy Dataset**: A second tidy dataset (`secTidySet`) was created by computing the average of each measurement variable, grouped by `subjectId` and `activityId`. This resulted in a dataset where each row represents a unique combination of subject and activity, with the average of the measurements for that combination.

## Final Tidy Dataset (`secTidySet.txt`)

- The final tidy dataset contains 68 variables (including `subjectId` and `activityType`) and 180 observations (for 30 subjects performing 6 activities).
- The dataset is sorted by `subjectId` and `activityId`.

## Summary

The `run_analysis.R` script prepares a clean and tidy dataset that can be used for further analysis. The main tasks include merging the training and test datasets, extracting relevant features, labeling activities, applying descriptive variable names, and creating a second tidy dataset with the average of each variable for each activity and subject.

For more information on how to run the script and obtain the final tidy dataset, please refer to the [README.md](README.md).
