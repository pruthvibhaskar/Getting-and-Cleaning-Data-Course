Run_Analysis.R downloads and performs the data preparation followed by 5 steps as described in course. 
1.	Downloading the dataset
o	Dataset is downloaded and extracted in the folder called UCI Har Dataset.

2.	Assign each data to the variables
o	features <- features.txt  
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals. It has data of 561 rows and 2 columns.
o	activities <- activity_labels.txt  
List of activities performed when the corresponding measurements were taken and its codes. It has data of 6 rows and 2 columns.
o	subject_test <- test/subject_test.txt 
comprises of test data of volunteer test subjects. It has data of 2947 rows and 1 column.
o	x_test <- test/X_test.txt 
comprises of recorded features test data. It has data of 2947 rows and 561 columns.
o	y_test <- test/y_test.txt 
comprises of test data of activities ‘code labels. It has data of 2947 rows and 1 column.
o	subject_train <- test/subject_train.txt 
comprises of train data of volunteer test subjects. It has data of 7352 rows and 1 column.
o	x_train <- test/X_train.txt 
comprises of recorded features train data. It has data of 7352 rows and 561 columns.
o	y_train <- test/y_train.txt  
comprises of train data of activities ‘code labels. It has data of 7352 rows and 1 column.

3.	Merges the training and the test sets to create one data set
o	X_Train_Bind is created by merging the x_train and x_test data by using rbind() function. It has data of 10299 rows and 561 columns.
o	Y_Train_Bind is created by merging the y_train and y_test data using rbind() function. It has data of 10299 rows and 1 column.
o	Subject_Bind is created by merging subject_train and subject_test data using rbind() function. It has data of 10299 rows and 1 column.
o	Data_Merged is created by merging Subject, Y_Train_Bind and X_Train_Bind using cbind() function. It has data of 10299 rows and 561 columns.

4.	Extracts only the measurements on the mean and standard deviation for each measurement
o	TidyData (10299 rows, 88 columns) created by subsetting Data_Merged, selecting columns: subject, code and their respective measurements on the mean and standard deviation (std)..

5.	Uses descriptive activity names to name the activities in the data set
o	Entire numbers in code column replaced with their corresponding activity that is taken from second column of the activities variable

6.	Appropriately labels the data set with descriptive variable names
o	code column renamed to activities
o	Acc replaced by Accelerometer
o	Gyro replaced by Gyroscope
o	BodyBody replaced by Body
o	Mag replaced by Magnitude
o	Words that start with character f replaced by Frequency
o	Words that start with character t replaced by Time

7.	From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
o	FinalData (180 rows, 88 columns) is created by summarizing the TidyData taking the means of each variable for every activity and subject, grouped by subject and activity.
o	Export the FinalData into FinalData.txt file.

