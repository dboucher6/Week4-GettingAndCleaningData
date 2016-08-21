
run_analysis <- function () {
  # load the plyr and dplyr package, and read all tables
  library(plyr); library(dplyr); library(reshape2)
  xtest <- read.table("./test/X_test.txt")
  ytest <- read.table("./test/y_test.txt")
  subject_test <- read.table("./test/subject_test.txt")
  xtrain <- read.table("./train/X_train.txt")
  ytrain <- read.table("./train/y_train.txt")
  subject_train <- read.table("./train/subject_train.txt")
  features <- read.table("features.txt")
  
  # Merge the training and the test sets to create one data set.  
  testdata <- cbind(subject_test, ytest, xtest)
  traindata <- cbind(subject_train, ytrain, xtrain)
  completedata <- rbind(testdata, traindata)
  
  # Appropriately label the data set with descriptive variable 
  # names.
  heading <- data.frame("V1" = c(0, 0), "V2" = c("subject", "activityn"))
  columns <- rbind(heading, features)
  colnames(completedata) <- columns$V2
  
  # Extract only the measurements on the mean and standard deviation 
  # for each measurement.
  condense <- completedata[,grepl("subject|activityn|mean()|std()", colnames(completedata))]
  
  # Use descriptive activity names to name the activities in the 
  # data set
  activity <- read.table("activity_labels.txt")
  colnames(activity) <- c("activityn", "Activity")
  condense <- merge(condense, activity, by="activityn", all.x=TRUE)
  condense <- select(condense, c(82, 2:81))
  
  # From the data set in step 4, create a second, independent tidy 
  # data set with the average of each variable for each activity and 
  # each subject.

  melted <- melt(condense, id=c("subject", "Activity"), measure.vars=c(3:81))
  reform <- dcast(melted, subject + Activity ~ variable, mean)
  write.table(reform, "tidydata.txt")
    }

