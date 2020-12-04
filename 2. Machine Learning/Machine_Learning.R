# make sure you're using the right WD. to check:
# getwd()
#to set a new one: setwd(~/path)

library(caret)

filename <- "iris.csv"

# loading CSV file from local directory and setting it to "dataset" variable
dataset <- read.csv(filename, header=FALSE)

#setting columns names
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")

# splitting loaded dataset 80% (working Dataset) - 20% (validation dataset). I'm now reducing my working dataset into 80% of its original content.

validation_index <- createDataPartition(dataset$Species, p=0.80, list=FALSE)

validation <- dataset[-validation_index,]

# use the 80% to test the models
dataset <- dataset[validation_index,]

# to view:
# > View(validation_index)
# > View(dataset)

# dataset dimensions: instances(rows) x attributes(columns)
dim(dataset)
# [1] 120   5

# types of attributes: list for each one of the attributes
sapply(dataset, class)
#Sepal.Length  Sepal.Width Petal.Length  Petal.Width      Species 
# "numeric"    "numeric"    "numeric"    "numeric"  "character" 

# first 5 rows
head(dataset)

# levels for the class
levels(dataset$Species)

# summarizing class distribution: each class has the same number of instances (40 occurances or 33%)
percentage <- prop.table(table(dataset$Species)) * 100
cbind(frec=table(dataset$Species), percentage=percentage)

