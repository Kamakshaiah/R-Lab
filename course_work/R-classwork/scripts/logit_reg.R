df_obj <- read.csv(file.choose())
dim(df_obj)

names(df_obj)
library('caTools')
split <- sample.split(df_obj$Status, SplitRatio = 0.8)
head(split)

training_set <- subset(df_obj, split == TRUE)
test_set <- subset(df_obj, split == FALSE)

dim(training_set)

library(caret)
library(ggplot2)
library('ellipsis')

logreg_model <- train(training_set[, c(3, 8, 23, 24)], training_set[, 33], method = 'glm')
