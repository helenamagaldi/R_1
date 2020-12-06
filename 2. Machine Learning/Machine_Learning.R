# make sure you're using the right WD. to check:
# getwd()
#to set a new one: setwd(~/path)

library(caret)
install.packages("AppliedPredictiveModeling", repos="http://R-Forge.R-project.org")

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

#summary of attributes
summary(dataset)

# univariate Plots :D 
x <- dataset[,1:4]
y <- dataset[,5]

# boxplot for each attribute
 par(mfrow=c(1,4))
     for(i in 1:4) {
         boxplot(x[,i], main=names(iris)[i])
     }
 
 # barplot for only Species class variable: graphical representation of the class distribution (in this case they're even, but the knowledge is worth it)
 plot(y)
 
 ##------ MULTIVARIATE PLOTS :D ------##
 
 #scatter plot of all pairs of attributes (color points by class). Also drawing ellipses around them
 
# scatter plot matrix
# featurePlot(x=x, y=y, plot="ellipse") not working.
#> featurePlot(x = iris[1:4], 
#                 +             y = iris$Sepal.Length,
#               +             plot = "density", 
#               +             scales = list(x = list(relation="free"),                                           +                           y = list(relation="free")),
#               +             auto.key = list(columns = 3))
 # ERROR:
 # Error in stack.data.frame(x) : no vector columns were selected

 
 scales <- list(x=list(relation="free"), y=list(relation="free"))
 featurePlot(x=x, y=y, plot="density", scales=scales)
 
 # featurePlot not working