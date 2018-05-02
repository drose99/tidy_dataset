# tidy_dataset
Massages UC Irvine Human Activity Recognition Using Smartphones Data Set into a tidy dataset

Program combines separate datasets of:
1) test dataset of 2947 observations of 561  variables
2) training dataset of 7352 observations of the same 561 variables
3) features dataset providing labels for the 561 variables
4) test activity id dataset for each of the 2947 test observation sets
5) training activity id dataset for each of the 7352 training observation sets
6) test subject id dataset identifying which of 30 subjects created each of the 2947 observation sets
7) training subject id dataset identifying which of 30 subjects created each of the 7352 observation sets
8) activity dataset associating an activity id with an activity

Steps:
1) Data was downloaded from defined URL to a course repository on the local harddrive
  Variable created:  date - timestamp of when the download was completed
2) Data was unzipped and stored on the local harddrive
3) 8 datasets described above were read into R
  Variables created:  xtest, xtrain, features, ytest, ytrain, subjecttest, subjecttrain, activity_labels
4) Renamed test and training dataset column names using values in the feature dataset
5) Gave descriptive column name to test and training subject id datasets
6) Gave description column name to activity name in activity dataset in preparation for #3 of the assignment
7) Appended the appropriate subject ID to the test and training datasets
  Variables created:  test, train
8) Bound the rows of the training and the test sets to create one data set as requested in #1 of the assignment
  Variables created:  merged
9) Extracted only the measurements on the mean and standard deviation for each measurement as requested in #2 of the assignment
  Variables created:  subset_columns
10) Merged the activity labels onto the remaining data completing #3 of the assignment
  Variables created:  complete
11) Created separate data frames for mean and standard deviation values to allow them to be displayed distinctly in the final tidy dataset
  Variables created:  mean_data, std_data
12) Created separate tidy datasets for mean and standard deviation values
  Variables created:  tidy_mean, tidy_std
13) Parsed the features column allowing distinct fields for the feature name and the dimension (when available)
  Variables created:  parse_feature_mean, parse_feature_std
14) Recombined the columns of the final tiny dataset
  Variable created:  final
15) Renamed the final dataset names to "Subject", "Activity", "Feature", "Dimension", "Mean", "StdDev" for clarity

See Codebook.MD for additional description of source data, transformations and variables.
