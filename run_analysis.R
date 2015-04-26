# Step 1: Merge the training and the test sets to create one data set.

# Read features for descriptive variable names
features <- read.table('features.txt')
# some feature names have brackets "()", which when used as col.names get replaced with ".", which does not look good.
# so we strip the brackets for aesthetic reasons
col_names <- gsub("\\(\\)","",as.character(features[,2]))
# We also fix some obviously bad naming from the original dataset
col_names <- gsub('BodyBody','Body',col_names)

# read training data sets, giving descriptive names for all columns
subject_train <- read.table('train/subject_train.txt', col.names = 'subject')
x_train <- read.table('train/X_train.txt', col.names = col_names)
y_train <- read.table('train/y_train.txt', col.names = 'activity_id')

# read test data sets
subject_test <- read.table('test/subject_test.txt', col.names = 'subject')
x_test <- read.table('test/X_test.txt', col.names = col_names)
y_test <- read.table('test/y_test.txt', col.names = 'activity_id')

# merge the training and the test sets to create one data set:
# first merge the columns of training and test data sets respectively
train <- cbind(subject_train, y_train, x_train)
test <- cbind(subject_test, y_test, x_test)
# then merge the rows of training and test data sets
one_data_set <- rbind(train, test)

# Step 2: Extract only the measurements on the mean and standard deviation for each measurement.

# grep features for std and mean measurements
# Note the "\\(" selects only measurements labelled mean() (i.e. with brackets), other measurements labelled mean but without don't come with corresponding standard deviation, so we choose to ignore them here
mean_and_std_column_indexes <- grep('std|mean\\(', features[,2])

# we define the columns to extract from one_data_set.
# need to add two added columns (subject and y) and an offset of 2 to the mean_and_std_column_indexes because of the two added columns at the beginning of the data frame
columns_to_extract <- c(1, 2, mean_and_std_column_indexes + 2)
filtered_data_set <- one_data_set[,columns_to_extract]

# Step 3: Use descriptive activity names to name the activities in the data set

# read activity labels
activity_labels <- read.table('activity_labels.txt', col.names = c('activity_id','activity_name'))
# merge data set with activity labels by activity_id (column activity_id exists in both tables)
tidy_data_set <- merge(filtered_data_set, activity_labels)

# Step 4: Appropriately label the data set with descriptive variable names.
# Already done in Step 1 when reading the data tables using col.names

# Step 5:
# From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

# Group the data set by subject and activity
group_by <- list(Subject = tidy_data_set$subject, Activity = tidy_data_set$activity_name)
# calculate the aggregate mean on grouped measurements
result <- aggregate(tidy_data_set[3:68], group_by, mean)

# finally order the result first by subject, then by activity
result <- result[order(result[1],result[2]),]

# and write result to a file
write.table(result, file = "result.txt", row.names = FALSE)

# you can read the file back in with:
# > result <- read.table('result.txt', header = TRUE)