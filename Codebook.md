
##Code Description
Below a brief description of the code:

###Reading and merging the moves
         testMoves <- read.csv("test/Y_test.txt", sep = "", header = FALSE)
         trainMoves <- read.csv("train/Y_train.txt", sep = "", header = FALSE)
         mergedMoves <- rbind(testMoves, trainMoves)
###Reading features and activities vectors
        features <- read.csv("features.txt", sep = "", header = FALSE)
        activities <- read.csv("activity_labels.txt", sep = "", header = FALSE)

###Merge of training and test sets of the measurements
        testSet <- read.csv("test/X_test.txt", sep = "", header = FALSE)
        trainSet <- read.csv("train/X_train.txt", sep = "", header = FALSE)
        mergedSet <- rbind(testSet,trainSet)   

###Reading Person IDs
        trainPerson <- read.csv("train/subject_train.txt", sep = "", header = FALSE)
        testPerson <- read.csv("test/subject_test.txt", sep = "", header = FALSE)
        mergedPerson <- rbind(testPerson, trainPerson)

###Rename set's columns as features
        names(mergedSet)<-features[,2]
###Keep only std deviation and mean
        mergedSet<-mergedSet[,grepl(x=names(mergedSet),pattern = "mean|std",ignore.case = T)]

###Descriptive ActivityName analysis
        mergedMoves <- merge(mergedMoves, activities, by.x = "V1", by.y = "V1")
        mergedSet <- cbind(mergedPerson, mergedMoves[,2], mergedSet)
        names(mergedSet)[1:2] <- c("PersonID", "Activities")
        mergedSet<-mergedSet[order(mergedSet$PersonID),]
        
###Creation of a tidy data set with the average of each variable for each activity and each subject.
          mergedSet<-aggregate(mergedSet,by = list(mergedSet$PersonID,mergedSet$Activities),FUN = mean)
          mergedSet$Activities<-mergedSet$Group.2
          mergedSet$Group.1<-NULL
          mergedSet$Group.2<-NULL
