# factor analysis 

fit <- princomp(mydata, cor=TRUE)
summary(fit)
loadings(fit)
plot(fit,type="lines")
fit$scores
biplot(fit) 

# library psych

library(psych)
fit <- principal(mydata, nfactors=5, rotate="varimax")
fit # print results


# determining number of factors

# Determine Number of Factors to Extract
library(nFactors)
ev <- eigen(cor(mydata)) # get eigenvalues
ap <- parallel(subject=nrow(mydata),var=ncol(mydata),
               rep=100,cent=.05)
nS <- nScree(x=ev$values, aparallel=ap$eigen$qevpea)
plotnScree(nS) 


fit <- factanal(mydata, 3, rotation="varimax")
print(fit, digits=2, cutoff=.3, sort=TRUE)

# plot factor 1 by factor 2
load <- fit$loadings[,1:2]
plot(load,type="n") # set up plot
text(load,labels=names(mydata),cex=.7) # add variable names 

# Principal Axis Factor Analysis
library(psych)
fit <- factor.pa(mydata, nfactors=3, rotation="varimax")
fit # print results 



library(FactoMineR)
result <- PCA(mydata) 






library(sem)
mydata.cov <- cov(mydata)
model.mydata <- specify.model()
F1 ->  x1, lam1, NA
F1 ->  x2, lam2, NA
F1 ->  x3, lam3, NA
F2 ->  x4, lam4, NA
F2 ->  x5, lam5, NA
F2 ->  x6, lam6, NA
X1 <-> x1, e1,   NA
X2 <-> x2, e2,   NA
X3 <-> x3, e3,   NA
X4 <-> x4, e4,   NA
X5 <-> x5, e5,   NA
X6 <-> x6, e6,   NA
F1 <-> F1, NA,    1
F2 <-> F2, NA,    1
F1 <-> F2, F1F2, NA

mydata.sem <- sem(model.mydata, mydata.cov, nrow(mydata))

# print results (fit indices, paramters, hypothesis tests)
summary(mydata.sem)
# print standardized coefficients (loadings)
std.coef(mydata.sem) 


