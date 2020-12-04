# make sure you're using the right WD. to check:
# getwd()
#to set a new one: setwd(~/path)

library(caret)

filename <- "iris.csv"

# loading CSV file from local directory and setting it to "dataset" variable
dataset <- read.csv(filename, header=FALSE)

#setting columns names
colnames(dataset) <- c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width","Species")