# install.packages('data.table')
# spotify data set
# https://www.kaggle.com/datasets/maharshipandya/-spotify-tracks-dataset
# 'D://Work//R//r-lab//R-Lab//course_work//data//dataset.csv' 

path <- readline()
pathch <- gsub('\\\\', '//', path)

filepath <- file.path(pathch, 'dataset.csv')

library(data.table)
popularity <- fread(filepath, select = c('popularity'))
class(popularity) # "data.table" "data.frame"
length(popularity)
head(popularity)

# sapply(popularity, function(x) c(mean(x), sd(x))) #or
poplrty <- sapply(popularity, function(x) as.numeric(x))
c(mean(poplrty), sd(poplrty))

# H0: mu = 0
# Ha: mu != 0

t.test(poplrty) # t = 503.14, df = 113999, p-value < 2.2e-16 # null rejected


# file path hotel reviews
# https://www.kaggle.com/datasets/thedevastator/sentiment-analyses-of-city-hotels

filepath <- file.path(pathch, 'hotel-reviews-la_all.csv')

reviews <- fread(filepath, select = c('Score'))
sapply(reviews, function(x) c(mean(x), sd(x)))
t.test(reviews) # t = 256.35, df = 620, p-value < 2.2e-16 # null rejected score is not zero

