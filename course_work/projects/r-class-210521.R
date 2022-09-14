dummydata <- matrix(rnorm(40), 10, 4)
dummydf <- data.frame(dummydata)

head(dummydf)
cor(dummydf)

sdat <- read.csv("D:/Work/R Scripts/data/sample-data.csv")

s_avg <- rowSums(cbind(sdat$s1, sdat$s2, sdat$s3))/3

satis_avgs <- rowMeans(cbind(sdat$s1, sdat$s2, sdat$s3))

s_sum
satis_avgs
length(s_sum)
length(sdat$s1)
