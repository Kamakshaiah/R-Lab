summary(lm(Loss ~ 0 + I(A_C^2) + I(A_NC^2), data = mydf))

x <- rnorm(50)
y <- x^2

lm(y ~ 0 + I(x^2), data = cbind.data.frame(x, y))
