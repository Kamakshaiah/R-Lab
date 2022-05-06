# simulate data set

cases <- round(rnorm(30)*100, 0)
cases <- abs(cases)

# summary

cases.mean <- mean(cases)
cases.var <- var(cases)
cases.std <- sd(cases)

USL <- cases.mean + ((1.96)*cases.std/sqrt(length(cases)))
LSL <- cases.mean - ((1.96)*cases.std/sqrt(length(cases)))

capability.index <- (USL - LSL)/(6*cases.std)

# histograms

hist(cases, xlim = c(-300, 300)); lines(density(cases), col = "red")
hist(cases, xlim = c(-300, 300), freq = FALSE); lines(density(cases), col = "red")
z <- (cases - mean(cases))/(sd(cases)/sqrt(length(cases)))
hist(z, freq = FALSE); lines(density(z), col = "red")

# non-normality

cases2 <- round(rpois(30, 50)*100, 0)
scatter.smooth(cases2)
z <- (cases - mean(cases2))/(sd(cases2)/sqrt(length(cases2)))
hist(z, xlim = c(-30, 30))


# taguchi capability index

tci <- (capability.index/sqrt(1+((cases.mean - targ)/cases.std)^2))

# target 

targ = cases.mean * 1.5
targ = cases.mean/1.5
