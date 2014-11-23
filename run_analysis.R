# using reshape2 for melt and dcast
library(reshape2)

# the location of the unziped data
dir_name <- "UCI HAR Dataset"
# the location of the ziped data
local_data_source = "getdata_projectfiles_UCI HAR Dataset.zip"
# the location of the data on the internet if does not exist locally
data_source <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
# create if not exists
if (!file.exists(dir_name)){
    if(!file.exists(local_data_source)){
        download.file(data_source, local_data_source)
    }
    unzip(local_data_source)
}

# the feature names
features <- read.table(".\\UCI HAR Dataset\\features.txt")
# only keep the ones that contain mean() or std() in the name
relevant_features <- features[grepl(".*(std\\(\\)|mean\\(\\)).*", features$V2),]
# the labels for the activities (numbers are used in the rest of the files)
activity_labels <- read.table(".\\UCI HAR Dataset\\activity_labels.txt")

# function to load data from a source (test or training)
get_data <- function(src = "test") {
    # the name of the actual data file
    file <- paste(".\\UCI HAR Dataset\\", src, "\\X_", src, ".txt", sep = "")
    # the name of the activity data file
    y_file <- paste(".\\UCI HAR Dataset\\", src, "\\y_", src, ".txt", sep = "")
    # the name of the subjects data file
    subject_file <- paste(".\\UCI HAR Dataset\\", src, "\\subject_", src, ".txt", sep = "")
    # data set with the all relevant variables
    ds <- read.table(file = file)[, relevant_features$V1]
    # data set with all the activity data
    y <- read.table(file = y_file)
    # data set with all the subject data
    subject <- read.table(file = subject_file)
    
    # set the correct column names to the relevant features
    colnames(ds) <- relevant_features$V2
    
    # create a column to contain the actual activity names (instead of the activity ids)
    ds$Activity <- sapply(rownames(ds), function(x) activity_labels[y[x, 1], 2])
    # create a column to contain the subject ids
    ds$Subject <- subject[,1]
    # return the data set
    ds
    }

# concatenate the test and train data sets
ds <- rbind(get_data("test"), get_data("train"))
# reshape the data set into a long format
long_ds <- melt(data = ds, measure.vars = relevant_features[,2], id.vars = c("Activity", "Subject"), variable.name = "Measurement", value.name = "Value")
# set the subject as factor so we can summarize by it
long_ds$Subject <- as.factor(long_ds$Subject)
# summarize the long data set by Activity and Subject and return each Measurement in a separate column
summary_ds <- dcast(long_ds, Activity+Subject~Measurement, mean, value.var = "Value")

# save to external file
out_file = "summarized.txt"
write.table(summary_ds, file = out_file, row.name=FALSE)
