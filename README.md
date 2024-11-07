# Getting and Cleaning Data - Peer Assessment Project

## Description

This project demonstrates how to clean and tidy data using R. The goal was to merge and clean datasets from a wearable computing study, preparing them for further analysis. The following transformations were performed in line with the course requirements:

1. **Merging the training and the test sets**: The training and test datasets were merged to create a single combined dataset.
2. **Extracting measurements on the mean and standard deviation**: The dataset was filtered to only include the measurements related to the mean and standard deviation for each variable.
3. **Using descriptive activity names**: The activity labels were applied to the dataset to replace numerical activity identifiers with descriptive names.
4. **Labeling the dataset with descriptive variable names**: Descriptive column names were applied to the dataset for clarity and better readability.
5. **Creating a second, independent tidy dataset**: A new tidy dataset was created that contains the average of each variable for each activity and each subject.

## R Script (`run_analysis.R`)

The R script `run_analysis.R` performs the steps outlined above to process and clean the data.

### Variables

- **`x_train`, `y_train`, `x_test`, `y_test`, `subject_train`, `subject_test`**: These variables contain data from the downloaded files (`X_train.txt`, `Y_train.txt`, `subject_train.txt`, etc.). They represent the feature values, activity labels, and subject identifiers for both training and test sets.
- **`x_data`, `y_data`, `subject_data`**: These variables merge the corresponding datasets (`x_train`, `x_test`, `y_train`, `y_test`, `subject_train`, and `subject_test`) for further analysis.
- **`features`**: Contains the correct names for the columns in the `x_data` dataset, which are then applied to the column names of the dataset.

### Detailed Steps in the Script:

1. **Loading the Data**: The script begins by reading the raw data files from the downloaded zip file.
2. **Assigning Column Names**: Descriptive column names from `features.txt` are applied to the `x_train` and `x_test` datasets.
3. **Merging Data**: The `train` and `test` sets are combined using `cbind` and `rbind` to create one complete dataset (`setAllInOne`).
4. **Extracting Relevant Columns**: Only columns containing the mean and standard deviation are retained using regular expressions.
5. **Labeling Activities**: Activity labels are merged into the dataset to replace numeric activity IDs with descriptive names.
6. **Creating Tidy Data**: A second dataset is created that contains the average of each variable for each subject and each activity, which is saved as `secTidySet.txt`.

## Output

- **`secTidySet.txt`**: This file contains the final tidy dataset, which includes the average of each measurement for each activity and each subject.
  
## Codebook

The **CodeBook.md** contains a detailed description of the variables, transformations, and data cleaning procedures used in this project. It also provides a summary of the data after it has been cleaned and tidied.

## Instructions to Run the Script

1. Download the zip file containing the dataset using the script.
2. Unzip the file in the `./data` directory.
3. Run the `run_analysis.R` script to clean and process the data.
4. The final output will be saved as `secTidySet.txt` in the working directory.

## Required Libraries

- **dplyr**: The script uses the `dplyr` library for data manipulation. Make sure to install it if it's not already installed:
  
  ```r
  install.packages("dplyr")
