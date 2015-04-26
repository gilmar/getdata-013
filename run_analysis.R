library(dplyr)
library(plyr)

setwd('~/courses/coursera/getdata-013/getdata-013-project')
if(!file.exists("./data")){dir.create("./data")}

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl,destfile="./data/data.zip",method="curl")
unzip("./data/data.zip", exdir="./data")

# Load data
X_train <- read.table("./data/UCI\ HAR\ Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI\ HAR\ Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI\ HAR\ Dataset/train/subject_train.txt")
X_test <- read.table("./data/UCI\ HAR\ Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI\ HAR\ Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI\ HAR\ Dataset/test/subject_test.txt")
features <- read.table("./data/UCI\ HAR\ Dataset/features.txt")
activity_labels <- read.table("./data/UCI\ HAR\ Dataset/activity_labels.txt")

#Appropriately labels the data set with descriptive variable names.
names(X_train) <- features[,2]
names(X_test) <- features[,2]
names(y_train) <- c("activity_code")
names(y_test) <- c("activity_code")
names(activity_labels) <- c("activity_code","activity_label")

#Uses descriptive activity names to name the activities in the data set
y_train$activity_label = activity_labels[match(y_train$activity_code,activity_labels$activity_code),"activity_label"]
y_test$activity_label = activity_labels[match(y_test$activity_code,activity_labels$activity_code),"activity_label"]

#Bind data sets with labels
train <- cbind(X_train,y_train)
test <- cbind(X_test,y_test)

#Add subject
train$subject <- subject_train$V1
test$subject <- subject_test$V1

#Merges the training and the test sets to create one data set.
fulldataset <- rbind(train,test)

