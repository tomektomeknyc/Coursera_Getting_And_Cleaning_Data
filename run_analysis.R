library(dplyr)
library(knitr)
library(plyr)

filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

# Checking if archive already exists.
if (!file.exists(filename)){
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  download.file(fileURL, filename, method="curl")
}

# Checking if unzipped  folder exists
if (!file.exists("UCI HAR Dataset")) {
  unzip(filename)
}
## Opening folder to get the  files list

file_path <- file.path("UCI HAR Dataset")
files <- list.files(file_path, recursive = TRUE)
files

## Read data from the files used in loading data

dataActivityTest <-read.table(file.path(file_path, "test", "Y_test.txt"), header = FALSE)
dataActivityTrain <- read.table(file.path(file_path, "train", "Y_train.txt"), header = FALSE)

dataSubjectTest <- read.table(file.path(file_path, "test", "subject_test.txt"), header = FALSE)
dataSubjectTrain <-read.table(file.path(file_path, "train", "subject_train.txt"), header = FALSE)

dataFeaturesTest <-read.table(file.path(file_path, "test", "X_test.txt"), header = FALSE)
dataFeaturesTrain <- read.table(file.path(file_path, "train", "X_train.txt"), header = FALSE)

## Concatenate tables by rows

dataActivity <- rbind(dataActivityTrain, dataActivityTest)

dataSubject <- rbind(dataSubjectTrain, dataSubjectTest)

dataFeatures <- rbind(dataFeaturesTrain, dataFeaturesTest)

## Add names to objects

names(dataActivity) <- c("activity")

names(dataSubject) <- c("subject")

dataFeaturesNames <-read.table(file.path(file_path, "features.txt"), head=FALSE)

names(dataFeatures) <- dataFeaturesNames$V2

## Merging columns

dataCombine <- cbind(dataSubject, dataActivity)

Data <-cbind(dataFeatures, dataCombine)

## Extracting mean and stdv measurements

subDataFeaturesNames <- dataFeaturesNames$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]


selectedNames<- c(as.character(subDataFeaturesNames), "subject", "activity")
Data <-subset(Data, select=selectedNames)

str(Data)

## Using activity names in data set

activityLabels <- read.table(file.path(file_path, "activity_labels.txt"), header = FALSE)

head(Data$activity, 30)


names(Data)<-gsub("std\\(\\)", "StandardDeviation", names(Data))
names(Data)<-gsub("t", "time", names(Data))
names(Data)<-gsub("f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))
names(Data)<-gsub("mean\\(\\)", "Mean", names(Data))
names(Data)



## Creating independent tidy data set and output to a file
FinalData<-aggregate(. ~subject + activity, Data, mean)
FinalData<-FinalData[order(FinalData$subject, FinalData$activity),]


write.table(FinalData, file = "FinalData.txt", row.name=FALSE)


str(FinalData)
FinalData

# Codebook

knit2html("codebook.Rmd")

