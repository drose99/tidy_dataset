Data

test dataset of 2947 observations of 561 variables.  Observations consist of measurements from wearable activity monitors
training dataset of 7352 observations of the same 561 variables.  Observations consist of measurements from wearable activity monitors
features dataset providing descriptive labels for the 561 variables
test activity id dataset for each of the 2947 test observation sets.  Activities were one of six activity types (e.g. walking, lying down)
training activity id dataset for each of the 7352 training observation sets
test subject id dataset identifying which of 30 subjects created each of the 2947 observation sets
training subject id dataset identifying which of 30 subjects created each of the 7352 observation sets
activity dataset associating an activity id with an activity


Transformations

Data was downloaded from defined URL to a course repository on the local harddrive Variable created: date - timestamp of when the download was completed
Data was unzipped and stored on the local harddrive
8 datasets described above were read into R Variables created: xtest, xtrain, features, ytest, ytrain, subjecttest, subjecttrain, activity_labels
Renamed test and training dataset column names using values in the feature dataset
Gave descriptive column name to test and training subject id datasets
Gave description column name to activity name in activity dataset in preparation for #3 of the assignment
Appended the appropriate subject ID to the test and training datasets Variables created: test, train
Bound the rows of the training and the test sets to create one data set as requested in #1 of the assignment Variables created: merged
Extracted only the measurements on the mean and standard deviation for each measurement as requested in #2 of the assignment Variables created: subset_columns
Merged the activity labels onto the remaining data completing #3 of the assignment Variables created: complete
Created separate data frames for mean and standard deviation values to allow them to be displayed distinctly in the final tidy dataset Variables created: mean_data, std_data
Created separate tidy datasets for mean and standard deviation values Variables created: tidy_mean, tidy_std
Parsed the features column allowing distinct fields for the feature name and the dimension (when available) Variables created: parse_feature_mean, parse_feature_std
Recombined the columns of the final tiny dataset Variable created: final
Renamed the final dataset names to "Subject", "Activity", "Feature", "Dimension", "Mean", "StdDev" for clarity


Variables

Untransformed source variables:
xtest - raw data obtained from the 9 individuals randomly assigned to the test group
xtrain - raw data obtained from the 21 individuals randomly assigned to the training group
features - source data labels for the 561 measurements taken for each observation
ytest - source data identifier of each activity type performed in the test observations
ytrain - source data identifier of each activity type performed in the training observations
subjecttest - source data identifier of which subject performed each observation in the test observations
subjecttrain - source data identifier of which subject performed each observation in the training observations
activity_labels - source data associating an activity id with an activity description

Transformed variables:
test - xtest data with column names appended from the features variable
train - xtrain data with column names appended from the features variable
merged - combined dataset of test and train data
subset_columns - subset of merged dataset containing only mean and standard deviation fields
complete - subset_columns dataset appended with descriptive activity labels
mean_data - subset of complete dataset extracting only mean fields
std_data - subset of complete dataset extracting only standard deviation fields
tidy_mean - transformed dataset from mean_data with mean feature and dimension data recorded as observations instead of fields
tidy_std- transformed dataset from std_data with standard deviation feature and dimension data recorded as observations instead of fields
parse_feature_mean - expanded tidy_mean dataset with feature column parsed into separate feature and dimension fields
parse_feature_std - expanded tidy_std dataset with feature column parsed into separate feature and dimension fields
final - re-bound, parsed mean and standard deviation datasets in final tiny format
