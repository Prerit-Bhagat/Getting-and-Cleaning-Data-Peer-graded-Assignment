if(!file.exists("./data")){
  dir.create("./data")
}

url<-'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
download.file(url,destfile = "./data/Dataset.zip")

unzip(zipfile = "./data/Dataset.zip",exdir = "./data")

x_train<-read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train<-read.table("./data/UCI HAR Dataset/train/y_train.txt")
sub_train<-read.table("./data/UCI HAR Dataset/train/subject_train.txt")

x_test<-read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test<-read.table("./data/UCI HAR Dataset/test/y_test.txt")
sub_tst<-read.table("./data/UCI HAR Dataset/test/subject_test.txt")

features<-read.table("./data/UCI HAR Dataset/features.txt")

activity_labels<-read.table("./data/UCI HAR Dataset/activity_labels.txt")

colnames(x_train)<-features[,2]
colnames(y_train)<-"activityId"
colnames(sub_train)<-"subjectId"


colnames(x_test)<-features[,2]
colnames(y_test)<-"activityId"
colnames(sub_tst)<-"subjectId"

colnames(activity_labels)<-c('activityId','activityType')

mrg_train <- cbind(y_train, sub_train, x_train)
mrg_test <- cbind(y_test, sub_tst, x_test)
setAllInOne <- rbind(mrg_train, mrg_test)

colNames<-colnames(setAllInOne)

meanandstd<-(grepl("activityId",colNames)|grepl("subjectId",colNames)
             |grepl("mean..",colNames)|grepl("sd..",colNames))


setformeanandsd<-setAllInOne[,meanandstd==TRUE]

setwithnames<-merge(setformeanandsd,activity_labels,by='activityId',all.x = TRUE)

secTidySet<-aggregate(.~subjectId+activityId,setwithnames,mean)

secTidySet<-secTidySet[order(secTidySet$subjectId,secTidySet$activityId),]

write.table(secTidySet,"secTidySet.txt",row.names = FALSE)
