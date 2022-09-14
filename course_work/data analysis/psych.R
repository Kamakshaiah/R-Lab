#==================================
# PSYCH PACAKGE - For demo
#==================================

# Objective: To understand structural equations given sample loadings

# Opening statement: If you know "factor covariances" and "loadings" it is easy to create the model. 



# SIM.CONGENERIC(): If we know loads we may create loadings matrix 

# SIM.HIRARCHICAL(): If we have factor loadings (matric()) and covariances (matrix()) we may create
# bifactor hirarchical structure with the help of this command.

# SIM.STRUCTURE(): If we have factor loadings we may compute correlation and covariance matrices 
# with the help of command "sim.structure"

# STRUCTURE.LIST(): We can design structural paths by desingning numbers of factors and their 
# covariances through "Phi"


# STRUCTURE.SEM(): We can painlessly create a structure (model) by choosing 
# coefficients (like a, b, c,....) and variables (like v1, v2, v3 ....)

# (Structures from known) MODELS

1. Mono/ one-factor: Two types (1) Congeneric - Where the factor loadings are 
    unequal; (2) tau equalent - Where factor loadings are unequal

2. Bifactor: sim.hirarchical() is used to create bifactor models. 
There are two factors (1) broad factor, (2) lower(order) factor. Examples - Mental 
ability; Neurotism. We need two loadings (1) g-loadings (broad factor), (2) f-loadings (lower factors) to execute
bifactor models. 

3. Hierarchical

# Load the library

library(psych)

# Simple exercise

cong <- sim.congeneric(N=100) # simulate factor covariance matrix
cong <- sim.congeneric(N=100, short = FALSE)
cong 

# Let us go for a dummy model

structure.diagram(c("a", "b", "c", "d")) # a dummy structure
m1 <- structure.diagram(c("a", "b", "c", "d"))
names(m1)
m1

# Independent factor model

fx <- matrix(c(.9,.8,.7,rep(0,9),.7,.6,.5,rep(0,9),.6,.5,.4), ncol=3)
three.fact <- sim.structure(fx) # simulate population correlation matrix (factor loadings )
three.fact
Phi = matrix(c(1,.5,.3,.5,1,.2,.3,.2,1), ncol=3) # Factor correlations
Phi
cor.f3 <- sim.structure(fx,Phi)
cor.f3

# Correlated factors model

structure.diagram(fx, Phi)
m2 <- structure.diagram(fx, Phi)
m2

------------------------------------------------------------------
# 3 factor dummy model  
------------------------------------------------------------------
  
fxs <- structure.list(9,list(F1=c(1,2,3),F2=c(4,5,6),F3=c(7,8,9)))
Phis <- phi.list(3,list(F1=c(2,3),F2=c(1,3),F3=c(1,2)))
fxs
Phis

structure.diagram(fxs,Phis)
m3 <- structure.diagram(fxs,Phis)
m3

--------------------------------------------------------
# Path models for Exploratory Factor Analysis Solutions
--------------------------------------------------------
  
corf3.mod <- structure.diagram(fxs,Phis)
corf3.mod

# Exploratory factor analysis

f3.p <- Promax(fa(cor.f3$model,3)) # Emploratory factor analysis
f3.p
structure.diagram(f3.p, cut=.2)

-----------------------------------------
# Bi-factor and Hierarchical models
-----------------------------------------
  
gload <- matrix(c(0.9, 0.8, 0.7), nrow=3) # Omega values for three factors from "g factor"
fload <- matrix(c(0.8, 0.7, 0.6, rep(0,9), 0.7, 0.6, 0.5, rep(0, 9), 0.7, 0.6, 0.4), ncol=3) 

# The above command creates factor loadings matrix

bifact <- sim.hierarchical(gload = gload, fload = fload) # Bifactor but hierarchical model
bifact
round(bifact, 2)

# Let us plot both bifactor & hierarchical structures

op <- par(mfrow=c(1, 2))
omega(bifact, title = "A bifactor model")
omega(bifact, sl=FALSE, title = "Hierarchical model")
op <- par(mfrow=c(1,1))


#----------------------------------------
# Structure diagram for a latent variable
#----------------------------------------

fx <- matrix(c(.9,.8,.7,rep(0,9),.7,.6,.5,rep(0,9),.6,.5,.4), ncol=3)
fy <- c(.6,.5,.4)
Phi <- matrix(c(1,.48,.32,.4,.48,1,.32,.3,.32,.32,1,.2,.4,.3,.2,1), ncol=4)

twelveV <- sim.structure(fx,Phi,fy)$model # Helps to understand models
colnames(twelveV) <-rownames(twelveV) <- c(paste("x",1:9,sep=""),paste("y",1:3,sep=""))
twelveV

structure.diagram(fx, Phi, fy)
m4 <- structure.diagram(fx, Phi, fy)
m4


# Exploratory models for analyzing structures

fxh <- structure.list(9, list(X1 = c(1:3), X2 = c(4:6), X3 = c(7:9), g=NULL))
fy <- structure.list(3, list(Y=c(1:3)))
Phi <- diag(1, 5, 5)
Phi[4,c(1:3)] <- letters[1:3]
Phi[5,4] <- "r"

structure.diagram(fxh, Phi, fy)
m5 <- structure.diagram(fxh, Phi, fy)
m5 

# See the structure diagram
# Three general factors and one latent factor
# Change the coefficients like factors 2, 3, 4 regress on 1 and 1 in turn regress on 5



#------------------------------
# Exploratory factor analysis
#------------------------------

cong1 <- sim.structure(fx)
cong1

# EFA by principal components

principal(cong1$model)

# EFA by "minres"

fa(cong1$model)

# You may also try factor.pa() that does factor analysis with principal axes

#-----------------------------------
# COMPARISION
#-----------------------------------

pc3 <- principal(bifact, 3)
pa3 <- fa(bifact, 3)
ml3 <- fa(bifact, 3)

# Let us see the results

pc3
pa3
ml3

#------------------------------
# Hierarchical - bifactor analysis
#------------------------------

# Function "omega" computes loadings through "Schmid-Leiman transformation"

om.bi <- omega(bifact)
om.hi <- omega(bifact, sl=FALSE)

# For cluster analysis use ICLUST

iclust(bifact)



#--------------------------------
# CONFIRMATORY FACTOR ANALYSIS
#--------------------------------

# Using "psych" as front end for confirmatory factor analysis

library(sem)

mod.tau <- structure.sem(c("a", "a", "a", "a"), labels = paste("V", 1:4, sep=""))
mod.tau

# Now let us compute sem statistics on "cong" data. 

sem.tau <- sem(mod.tau, cong$model, 100)
summary(sem.tau)

# Let us make another model where the coefficients are different (not congeneric)
# and let us test if the change is significant (Ho: the correlations found
# congeneric (cong data) model are tau equalent)

mod.cong <- structure.sem(c("a", "b", "c", "d"), labels = paste("V", 1:4, sep=""))
mod.cong

# Let us perform sem

sem.cong <- sem(mod.cong, cong$model, 100)
summary(sem.cong)

# Now let us compare both models (i.e. sem.tau, sem.cong)

anova(sem.cong, sem.tau) # tests the difference between two models

# p-value: 0.1493 the difference is significant; as per revelles interpretation.

#----------------------------------------------------
# Testing the dimensionality of hierarchical data set
#----------------------------------------------------

# We can use EFA solution as input for SEM


f1 <- factanal(covmat = bifact, factors = 1) # oblimin
mod.f1 <- structure.sem(f1)
sem.f1 <- sem(mod.f1, bifact, 100)
sem.f1
structure.graph(mod.f1)

# EFA with "fa()"

f2 <- fa(bifact, 3, rotate = "varimax") # varimax
mod.f3 <- structure.sem(f2)
sem.f3 <- sem(mod.f3, bifact, 100)
summary(sem.f3)

# EFA with fa() with default oblimin

f3 <- fa(bifact, 3)
mod.f3 <- structure.sem(f3)
mod.f3

