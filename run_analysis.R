if (!(file.exists("./UCI HAR Dataset/train/X_train.txt")
     && file.exists("./UCI HAR Dataset/test/X_test.txt"))){
 
  download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
                "./UCI_HAR_Dataset.zip")
  unzip("./UCI_HAR_Dataset.zip")
}
#Read the feature file and filter out the column that are standard deviation and mean

colnames <- read.table(file = "./UCI HAR Dataset/features.txt")
std_mean_colnames <- colnames[grep("std|mean",colnames$V2),1]
train <- read.table(file = "./UCI HAR Dataset/train/X_train.txt", col.names=colnames[,2])
test <- read.table(file = "./UCI HAR Dataset/test/X_test.txt", col.names=colnames[,2])
merged_data <- rbind(train,test)
merged_data <- merged_data[std_mean_colnames]


activity_train <- read.table(file="./UCI HAR Dataset/train/y_train.txt")
activity_test <- read.table(file="./UCI HAR Dataset/test/y_test.txt")
merged_activity <- rbind(activity_train,activity_test)
merged_activity_labels <- factor(merged_activity[,1],labels=c("WALKING",
                                                              "WALKING_UPSTAIRS",
                                                              "WALKING_DOWNSTAIRS",
                                                              "SITTING",
                                                              "STANDING",
                                                              "LAYING"))

subject_train <- read.table(file="./UCI HAR Dataset/train/subject_train.txt")
subject_test <- read.table(file="./UCI HAR Dataset/test/subject_test.txt")
merged_subject <- rbind(subject_train,subject_test)
merged_data["Activity.Name"] <- merged_activity_labels
merged_data["Subject.Id"] <- merged_subject[,1]
melted_data <- melt(merged_data,id = c("Subject.Id","Activity.Name") )
tidy_data <- cast(melted_data, Subject.Id+Activity.Name~variable, mean)
write.table(tidy_data,file="tidy_data",row.name=FALSE)
