##Getting and Cleaning data : Course Project

##Code Book

##Sets considered
* Test and train sets
##Dimensions of the tidy dataset
* Subject : Id of the test subbject
* Activity : The activity performed for which the mesurements were taken (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

##Measurements
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. 

These signals were used to estimate variables of the feature vector for each pattern:
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

##Steps of the analysis

# 1. Merges the training and the test sets to create one data set
Load the Zip file and unzip it, then load the three files for the test and train datasets : the Subject, X and Y files and cbind them
Than, once that is done, cbind the two sets of files

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
Once the datasets are ready, we load the features info to name the columns
We then choose only the columns that contains the mean or standard deviation information and filter the dataset based on that

# 3. Uses descriptive activity names to name the activities in the data set
Replace the activities ID with its label

# 4. Appropriately labels the data set with descriptive variable names.
Rename some column names that are not easily understood

# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
The tidy data set is stored in the tidyAll.txt file, and also run the run_analysis() script to get the dataset
