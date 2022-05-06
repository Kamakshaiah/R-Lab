# covariance

x <- matrix(round(rnorm(20), 2), 10, 2, byrow = TRUE)
x_xbar <- x[, 1] - mean(x[, 1])
y_ybar <- x[, 2] - mean(x[, 2])
numer <- sum(x_xbar*y_ybar)
denom <- dim(x)[[1]]-1
mycov <- numer/denom
print(mycov)

# correlation

mycorel <- cov(x[, 1], x[, 2])/(sd(x[, 1])*sd(x[, 2]))
mycorel

# outliers

zx <- (x[, 1]-mean(x[,1]))/sd(x[,1])
zy <- (x[, 2]-mean(x[,2]))/sd(x[,2])
	# plot for above values

li <- smooth.spline(zx, zy, spar = 0.6)
plot(zx, zy); lines(li, col = "red")