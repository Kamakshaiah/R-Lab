# simulation of the data sets

cases <- abs(round(rnorm(30)*100, 0))

# noramlity check

hist(cases, freq = FALSE); lines(density(cases), col = "red")
z <- (cases - mean(cases))/(sd(cases)/sqrt(length(cases)))
hist(z, freq = FALSE); lines(density(z), col = "red")

USL <- (mean(cases) + (1.96*(sd(cases)/sqrt(length(cases)))))
LSL <- (mean(cases) - (1.96*(sd(cases)/sqrt(length(cases)))))

cap.ind <- (USL - LSL)/(6*sd(cases))

# non-normal
# data simulation 

cases2 <- abs(round(rpois(30, 10)*10, 0))

# normality check

hist(cases2, freq = FALSE); lines(density(cases2), col = "red")

c.mean <- mean(cases2)
c.sd <- sd(cases2)

USL <- c.mean + (1.96*(c.sd/sqrt(length(cases2))))
LSL <- c.mean - (1.96*(c.sd/sqrt(length(cases2))))

cu <- (USL - c.mean)/(3*c.sd)
cl <- (c.mean - LSL)/(3*c.sd)

cpk <- min(cu, cl)
