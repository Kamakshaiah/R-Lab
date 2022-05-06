mydf <- read.csv(file.choose())

fit <- lm(mydf$Loss_Z ~ 0 + I(mydf$A_CZ + mydf$A_NCZ)^2, data = mydf)

x <- abs(round(rnorm(10)*100, 0))
y <- x^2

summary(lm(y ~ x + I(x^2) + I(x^3)))

