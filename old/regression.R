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
There are dozens and dozens of models to perform regression. However following 
are sufficient for structural equation modelling

1. Linear 
2. Non-linear

3. Logit 
4. Probit



#--------------------------------------------------------------------------------
# 2.1. Simple linear regression
#--------------------------------------------------------------------------------

satisfaction = sample(1:2, 10, replace=TRUE) 
age = round(rnorm(10)*100, 0)
income = round(rnorm(10)*100000, 0)
occupation = sample(1:2, 10, replace=TRUE)

mydf <- data.frame(cbind(satisfaction, age, income, occupation))
class(mydf)
names(mydf)

fit <- lm(satisfaction ~ age+income+occupation, data = mydf)

semPaths(fit)




#--------------------------------------------------------------------------------
# 2.2. Non linear regression
#--------------------------------------------------------------------------------

satisfaction = sample(1:2, 10, replace=TRUE) 
satisfaction = exp(satisfaction)
age = abs(round(rnorm(10)*100, 0))
income = round(rnorm(10)*100000, 0)
occupation = sample(1:2, 10, replace=TRUE)

mydf <- data.frame(cbind(satisfaction, age, income, occupation))
class(mydf)
names(mydf)

fit <- lm(satisfaction ~ age+income+occupation, data = mydf)

semPaths(fit)


#--------------------------------------------------------------------------------
# 2. 3. Logit and Probit models
#--------------------------------------------------------------------------------



#--------------------------------------------------------------------------------
# Visualization through semPlots
#--------------------------------------------------------------------------------



