setwd('~/courses/coursera/getdata-013/getdata-013-project')
if(!file.exists("./data")){dir.create("./data")}

zipUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(zipUrl,destfile="./data/data.zip",method="curl")
unzip("./data/data.zip", exdir="./data")

X_train <- read.table("./data/UCI\ HAR\ Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI\ HAR\ Dataset/train/y_train.txt")
subject_train <- read.table("./data/UCI\ HAR\ Dataset/train/subject_train.txt")
X_test <- read.table("./data/UCI\ HAR\ Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI\ HAR\ Dataset/test/y_test.txt")
subject_test <- read.table("./data/UCI\ HAR\ Dataset/test/subject_test.txt")
features <- read.table("./data/UCI\ HAR\ Dataset/features.txt")
activity_labels <- read.table("./data/UCI\ HAR\ Dataset/activity_labels.txt")