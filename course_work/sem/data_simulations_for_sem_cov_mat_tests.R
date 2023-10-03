library(lavaan)

x1 <- rnorm(30)
x2 <- rnorm(30)
x3 <- rnorm(30)

y1 <- x1 + abs(rnorm(1))
y2 <- x2 + abs(rnorm(1))
y3 <- x3 + abs(rnorm(1))

basedf <- data.frame(x1 = x1, x2 = x2, x3 = x3, y1 = y1, y2 = y2, y3 = y3)

basedf <- data.frame(rWishart(1, 30, Sigma = diag(30)))[, 1:6]
dim(basedf)
head(basedf)
names(basedf)
colnames(basedf) <- c(x1, x2, x3, y1, y2, y3)

eigen(cov(basedf)) # -ve non-psd

model <- '
  
  Y =~ X4 + X5 + X6 
  X =~ X1 + X2 + X3 
  
  Y ~ X

'

fit <- sem(model, basedf) #warning
summary(fit)

# SIMULATIONS

# correlations <- c(1, 0.76, 0.77, 0.78, 0.79, 0.81, 0.82, 0.83, 0.84)
# n <- length(correlations)
# samples <- correlations * rnorm(1) + sqrt(1 - correlations^2) * rnorm(n)

# mass PACKAGE
## psdm for basedf df

# Sigma <- matrix(c(10,3,3,2),2,2)
# Sigma
# var(mvrnorm(n = 180, rep(0, 6), Sigma))
# var(mvrnorm(n = 180, rep(0, 2), Sigma, empirical = TRUE))

Sigma <- abs(cov(basedf))

psddf <- mvrnorm(n = 180, rep(0, 6), Sigma) # 6 varibles in basedf
class(psddf)

psddf <- as.data.frame(psddf)
class(psddf)
names(psddf)

model <- '
  
  Y =~ X4 + X5 + X6 
  X =~ X1 + X2 + X3 
  
  Y ~ X

'

fit <- sem(model, psddf)
summary(fit)

# homogeneity test for covariances of original and simulated data

library(covTestR)

Ahmad2017(list(as.matrix(basedf), as.matrix(psddf))) # rejected H0; difference is significant (d = 0)

# FULL CODE 
# obtain covariance matrix from correlation matrix
# https://stats.stackexchange.com/questions/62850/obtaining-covariance-matrix-from-correlation-matrix

mat <- matrix(rnorm(30), 10, 3)

cormat <- cor(mat)
sds <- apply(mat, 2, sd)

covmat <- diag(sds) %*% cormat %*% diag(sds)
cov(mat) # same

# simulating data from covariance matrix 
covmatsim <- abs(cov(mat))
simdata <- mvrnorm(30, rep(0, 3), Sigma = covmatsim)
cov(simdata)
simdf <- data.frame(simdata)
names(simdf)

model <- '
  X1 ~ X2
  X2 ~ X3
'

fit <- sem(model, simdf)
summary(fit)

model <- '
  Y =~ X1 
  X =~ X2 + X3
  
  Y ~ X
'

model <- '
  Y =~ X1 + X2
  X =~ X2 + X3
  
  Y ~ X
'
fit <- sem(model, simdf) # warning

model <- '
  Y =~ X1 + X2
  X =~ X3
  
  Y ~ X
'
fit <- sem(model, simdf) # works
summary(fit)

model <- '
   X1 ~ c* X3
   X2 ~ a*X3
   X1 ~ b*X2
   
   ab := a *b
   te := c + (a*b)
   
'

fit <- sem(model, simdf)
summary(fit)
