#================================================================================
# SESSION - 2
#================================================================================
# REGRESSION MODELS
#================================================================================
# 1. What is regression?
#--------------------------------------------------------------------------------

#--------------------------------------------------------------------------------
# 2. Types of regression 
#--------------------------------------------------------------------------------
# There are dozens and dozens of models to perform regression. However following 
# are sufficient for structural equation modelling

# 1. Linear (simple vs. multivariate) 
# 2. Non-linear ()

# 3. Logit 
# 4. Probit



#--------------------------------------------------------------------------------
# 2.1. Simple linear regression
#--------------------------------------------------------------------------------

# simulation

satisfaction = sample(1:2, 10, replace=TRUE) 
age = round(rnorm(10)*100, 0)
income = round(rnorm(10)*100000, 0)
occupation = sample(1:2, 10, replace=TRUE)

# data frame
mydf <- data.frame(cbind(satisfaction, age, income, occupation))
class(mydf)
names(mydf)

# multivariate regresion
fit <- lm(satisfaction ~ age+income+occupation, data = mydf)

library(semPlot)
semPaths(fit)

satisfaction = sample(1:2, 10, replace=TRUE) 
satisfaction = exp(satisfaction)
age = abs(round(rnorm(10)*100, 0))
income = round(rnorm(10)*100000, 0)
occupation = sample(1:2, 10, replace=TRUE)

mydf <- data.frame(cbind(satisfaction, age, income, occupation))
class(mydf)
names(mydf)

fit <- lm(satisfaction ~ age+income+occupation, data = mydf)

semPaths(fit, whatLabels = "par", what = "path", layout = "tree2", curvePivot = TRUE)

# Example 2

# simulation

x <- rnorm(100)
y <- rnorm(100)
z <- rnorm(1)*x+rnorm(1)*y+rnorm(1)*x*y

mydf <- data.frame(x, y, z)

# regression
res <- lm(z ~ x*y, data = mydf)

# path diagrams

semPaths(res, what = "par", intAtSide = TRUE)
semPaths(res,"par", intAtSide=TRUE)

# PLOTS
------------
  
# Outlier test

library(car) # for Bonferroni p-value
outlierTest(res) # Bonferroni p-value is a value obtained by multiplying p-value (ND) ny number of observations
qqPlot(res)

lines(mydf)

# Leverage plots 

leveragePlots(res)

# Influential observations
# added variable plots

av.plots(res)
# Coocks D plot 
# identify D values > 4/(n-k-2)
cutoff <- 4/(nrow(mydf)-length(res$coefficients)-2)
plot(res, which = 4, cook.levels = cutoff)

# Influence plots

influencePlot(res, id.method="identify", main="influence plots")

# Non-normality
-----------------

qqPlot(res)

library(MASS)
sresid <- studres(res)
hist(sresid, freq = FALSE)

xfit <- seq(min(sresid), max(sresid), length = 20)
yfit <- dnorm(xfit)

lines(xfit, yfit)

# Test for Homoscedasticity (Non constant error variance test)
--------------------------------------------------------------
ncvTest(res)

# Spread level plot between studentized residuals and fitted values

spreadLevelPlot(res)


# Multicollinearity
---------------------
  
# to evaluatge collinearity
vif(res) # variance inflation factors
sqrt(vif(res)) > 2 # are these factors problematic? 


# Non-linearity
---------------
# We got to do regression again due to the reason that crPlots is not available for interactions  
res1 <- lm(z ~ x+y, data = mydf)
crPlots(res1)

# ceres plot

ceresPlots(res1)


# Test for autocorrelation (Test for autocorrelated errors)
-----------------------------------------------------------
  
durbinWatsonTest(res)

# Additional diagnostics (additional operations for skewness, kurtosis and heteroskedasticity)
library(gvlma) # not yet installed 
gvmodel <- gvlma(res)
summary(gvmodel)

#--------------------------------------------------------------------------------
# 2.2. Non linear regression
#--------------------------------------------------------------------------------


#--------------------------------------------------------------------------------
# 2. 3. Logit and Probit models
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
# Visualization through semPlots
#--------------------------------------------------------------------------------



