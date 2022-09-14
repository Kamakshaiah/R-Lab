help("shapiro.test")
rnorm(10)
normdist <- rnorm(100)*rnorm(1)

shapiro.test(normdist)

# Ho: normal
# H: non-normal

# ks.test

help("ks.test")
ks.test(normdist, "pnorm")

# nortest

library(nortest)
ad.test(rnorm(100))

cvm.test(rnorm(100))

lillie.test(rnorm(100, mean = 3, sd = 5))

pearson.test(rnorm(100))

shapiro.test(normdist)

sf.test(normdist)


