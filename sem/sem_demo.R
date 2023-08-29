# direct

x1 <- round(runif(20, 10, 100))
x2 <- round(runif(20, 10, 100))
x3 <- round(runif(20, 10, 100))

y1 <- round(runif(20, 10, 100))
y2 <- round(runif(20, 10, 100))
y3 <- round(runif(20, 10, 100))

testdat <- data.frame(x1, x2, x3, y1, y2, y3)


library(lavaan)

model <- '
  # latent 
  
  X =~ x1 + x2 + x3 
  Y =~ y1 + y2 + y3 
  
  # direct 
  
  Y ~ X
  
'

fit <- sem(model, testdat)
summary(fit)


M <- runif(20, 10, 100)
testdat[, 'M'] <- M
head(testdat)

model <- '
  # latent 
  
  X =~ x1 + x2 + x3
  Y =~ y1 + y2 + y3
  
  # direct 
  
  Y ~ c*X
  
  # mediator
  M ~ a*X
  Y ~ b*M
  
  # indirect
  
  ab:= a*b
'

fit <- sem(model, testdat)
summary(fit)


# sampled data

x1 <- sample(1:5, 120, replace = T)
x2 <- sample(1:5, 120, replace = T)
x3 <- sample(1:5, 120, replace = T)

y1 <- sample(1:3, 120, replace = T)
y2 <- sample(1:3, 120, replace = T)
y3 <- sample(1:3, 120, replace = T)

testdat1 <- data.frame(x1, x2, x3, y1, y2, y3)
head(testdat1)

M <- sample(1:3, 120, replace = T)

testdat1[, 'M'] <- M
head(testdat1)

model <- '
  # latent 
  
  X =~ x1 + x2 + x3
  Y =~ y1 + y2 + y3
  
  # direct 
  
  Y ~ c*X
  
  # mediator
  M ~ a*X
  Y ~ b*M
  
  # indirect
  
  ab:= a*b
'

fit <- sem(model, testdat1)
summary(fit)

M1 <- sample(1:3, 120, replace = T)
M2 <- sample(1:3, 120, replace = T)

testdat1[, 'M1'] <- M1
testdat1[, 'M2'] <- M2
head(testdat1)

model <- '
  # latent 
  
  X =~ x1 + x2 + x3
  Y =~ y1 + y2 + y3
  
  # direct 
  
  Y ~ c*X
  
  # mediator
  M ~ a*X
  Y ~ b*M
  
  M1 ~ d*X
  Y ~ e*M1
  
  
  # indirect
  
  ab:= a*b
  de:= d*e
'

fit <- sem(model, testdat1)
summary(fit)

library(semPlot)
semPlot::semPaths(fit) # possible 
