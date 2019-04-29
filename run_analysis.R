


 # Load the dplyr Package
  library(dplyr)


 # Downloading the Data Set

  Data_file <- "Coursera_DS3_Final.zip"


# Checking if file already exists.

  if (!file.exists(Data_file)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, Data_file, method="curl")
  }  

# Checking if folder exists

  if (!file.exists("UCI HAR Dataset")) { 
    unzip(Data_file) 
  }


#Assigning data frames

  features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n","functions"))
  activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
  subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
  x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
  y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
  subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
  x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
  y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")


 # <!--  Step 1: Merges the training and the test sets to create one data set -->
  X_Train_Bind <- rbind(x_train, x_test)
  Y_Train_Bind <- rbind(y_train, y_test)
  Subject_Bind <- rbind(subject_train, subject_test)
  Data_Merged  <- cbind(Subject_Bind, Y_Train_Bind, X_Train_Bind)



 # <!-- Step 2: Extracts only the measurements on the mean and standard deviation for each measurement. -->
  
  MeanStd_data <- grep("mean()|std()", features[, 2]) 
  Data_Merged <- Data_Merged[,MeanStd_data]
  TidyData <- Data_Merged






# <!-- Step 3: Uses descriptive activity names to name the activities in the data set. -->
  
  TidyData$code <- activities[TidyData$code, 2]

  

# <!-- Step 4: Appropriately labels the data set with descriptive variable names. -->
  
  names(TidyData)[2] = "activity"
  names(TidyData)<-gsub("Acc", "Accelerometer", names(TidyData))
  names(TidyData)<-gsub("BodyBody", "Body", names(TidyData))
  names(TidyData)<-gsub("Mag", "Magnitude", names(TidyData))
  names(TidyData)<-gsub("Gyro", "Gyroscope", names(TidyData))
  names(TidyData)<-gsub("angle", "Angle", names(TidyData))
  names(TidyData)<-gsub("gravity", "Gravity", names(TidyData))
  names(TidyData)<-gsub("tBody", "TimeBody", names(TidyData))
  names(TidyData)<-gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
  names(TidyData)<-gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
  names(TidyData)<-gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
  names(TidyData)<-gsub("^f", "Frequency", names(TidyData))
  names(TidyData)<-gsub("^t", "Time", names(TidyData))

  
  
 # <!-- Step 5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject. -->
  
  FinalData <- TidyData %>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))
  write.table(FinalData, "FinalData.txt", row.name=FALSE)

  # <!-- Checking if Data Exists in FinalData -->
  str(FinalData)
  FinalData


