# MULTIVARIATE ANALYSIS
-----------------------
  
  # 1. Data Simulation
  -------------------
  v1 <- c(1,1,1,1,1,1,1,1,1,1,3,3,3,3,3,4,5,6)
  v2 <- c(1,2,1,1,1,1,2,1,2,1,3,4,3,3,3,4,6,5)
  v3 <- c(3,3,3,3,3,1,1,1,1,1,1,1,1,1,1,5,4,6)
  v4 <- c(3,3,4,3,3,1,1,2,1,1,1,1,2,1,1,5,6,4)
  v5 <- c(1,1,1,1,1,3,3,3,3,3,1,1,1,1,1,6,4,5)
  v6 <- c(1,1,1,2,1,3,3,3,4,3,1,1,1,2,1,6,5,4)
  mydf <- cbind(v1,v2,v3,v4,v5,v6)
  cor(mydf)
  
------------------------
# MULTIVARIATE NORMALITY
------------------------

library(MVN)
res <- mardiaTest(mydf, qqplot=FALSE)
res

------------------------
# HETEROGENEITY
------------------------
  
test <- bartletts.test(mydf)
test


------------------------
  # OUTLIERS
-----------------------

qqnorm(mydf)
qqline(mydf)  

#I     PRINCIPAL COMPONENT ANALYSIS (Basic approach - prcomp(); factanal())
-------------------------------------


factanal(mydf, factors = 3) # varimax is the default
factanal(mydf, factors = 3, rotation = "promax")

prcomp(mydf)

res <- factanal(~v1+v2+v3+v4+v5+v6, factors = 3, scores = "Bartlett")
names(res)
res$scores


#-----------------------------
#  II     FactoMineR
#-----------------------------

library(FactoMineR)
result <- PCA(mydf) # graphs generated automatically 




