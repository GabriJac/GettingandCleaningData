#Code that creates a simple descriptive table of dataset's features
#applying function SUMMARY to every feature of the dataset we report in our table properties
#of numeric attributes like max or min
df<-sapply(mergedSet,FUN = summary)
#Indication of attribute's class(numeric, character...)
df<-rbind(df,Class=sapply(mergedSet,FUN = class))
df<-t(df)
df<-as.data.frame(df)
