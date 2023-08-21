# feature selection using means method
dataf <- matrix(rnorm(120), 30, 4)
dataf <- data.frame(dataf)
names(dataf)
head(dataf)
apply(dataf, 2, mean)
mean(apply(dataf, 2, mean))
plot(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))))
plot(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean)))); text(c(apply(dataf, 2, mean), mean(apply(dataf, 2, mean))), labels = c('x1', 'x2', 'x3', 'x4', 'gm'), pos = 2)