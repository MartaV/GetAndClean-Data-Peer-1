## This script prepares a (dirty) data set for further analysis by recasting it into a
## desired (tidy) form as tasked in the Peer Assessment assignment for Getting and Cleaning 
## Data course.

## Dependency
require(reshape2)

## Assuming we have the main .zip file unpacked in our current working directory for R
# Loading all test data
subject_test = read.table("UCI HAR Dataset/test/subject_test.txt")
x_test = read.table("UCI HAR Dataset/test/X_test.txt")
y_test = read.table("UCI HAR Dataset/test/y_test.txt")

# Loading all train data
subject_train = read.table("UCI HAR Dataset/train/subject_train.txt")
x_train = read.table("UCI HAR Dataset/train/X_train.txt")
y_train = read.table("UCI HAR Dataset/train/y_train.txt")

# Merging all test data together
test_data = cbind(subject_test, y_test, x_test )
# Merging all train data together
train_data = cbind(subject_train, y_train, x_train)
# Merging both tables of data together, train and test
complete_data = rbind(test_data, train_data)

# Loading features file, using it to construct column names 
features = read.table("UCI HAR Dataset/features.txt")
columntitles = c("Subject", "Activity", as.character(features[,2]))
colnames(complete_data) = columntitles

# Extracting std and mean measurements' indices from the whole set of measurements:
stdMeasurementIndex = grep(("-std\\(\\)"), features[, 2]) +2
meanMeasurementIndex = grep(("-mean\\(\\)"), features[, 2]) +2
# Extracting std and mean measurements from the whole set of data:
stdDevData = complete_data[,stdMeasurementIndex]
meanData = complete_data[,meanMeasurementIndex]

# Extracting activity levels from file:
activity_names = read.table("UCI HAR Dataset/activity_labels.txt")
# Create data frame with activity name for each row, ensuring descriptive activity names for the activities in the data set
activity_name_col = data.frame(factor(complete_data$Activity, levels=activity_names[,1], labels=activity_names[,2]))
colnames(activity_name_col) = "ActivityName"

# Merge std, mean and activity name data, producing a std and mean measurements only data set
extracted_data = cbind(complete_data[,1:2], activity_name_col, meanData, stdDevData)

# Restructure data with melt (needs reshape2):
melted_data = melt(extracted_data,id = c("Subject", "Activity", "ActivityName"))
# recast data sorted by Subject/Activity and take mean of all other variables
tidy_data = dcast(melted_data, formula = Subject + Activity + ActivityName ~ variable, mean)
write.table(tidy_data,"tidy_data.txt",row.names=FALSE)
