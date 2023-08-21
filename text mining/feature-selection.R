# feature selection using means method

dataf <- matrix(rnorm(120), 30, 4)
dataf <- data.frame(dataf)
names(dataf)
head(dataf)

apply(dataf, 2, mean)
mean(apply(dataf, 2, mean))
plot(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))))
plot(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean)))); text(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))), labels = c('x1', 'x2', 'x3', 'x4', 'gm'), pos = 2)

apply(dataf, 2, mean)
mean(apply(dataf, 2, mean)) # -0.009256273
max(apply(dataf, 2, mean)) # 0.268075
min(apply(dataf, 2, mean)) # -0.1556151

(max(apply(dataf, 2, mean)) + min(apply(dataf, 2, mean)))/2 # fs-measure - 0.05622998


plot(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))))
plot(c(apply(dataf, 2, mean), 0.05622998)); text(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))), labels = c('x1', 'x2', 'x3', 'x4', 'gm'), pos = 2)
