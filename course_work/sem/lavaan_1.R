library(lavaan) # load the package
data(package="lavaan")
data(HolzingerSwineford1939)
help("HolzingerSwineford1939")

Method - 1
-----------
  
hs.model <-   'visual =~ x1+x2+x3
              textual =~ x4+x5+x6
              speed =~ x7+x8+x9'
             
fit <- cfa(hs.model, data = HolzingerSwineford1939)
parTable(fit)

# We may also choose not fixing factor loadings rather latent variables can be 
# fixed 

Methods - 1: standard method
------------------------------
  
hs.model1 <- 'visual =~ NA*x1+x2+x3
              textual =~ NA*x4+x5+x6
              speed =~ NA*x7+x8+x9

              visual ~~ 1*visual
              textual ~~ 1*textual
              speed ~~ 1*speed'

fit1 <- cfa(hs.model1, data=HolzingerSwineford1939)

# Let us compare the models

anova(fit, fit1)

# I don't thing the two models are not significantly different and there is 
# overwhelming evidence to alternative hypothesis (both models are similar)

fit
fit1

# Let us try with "stv.le" argument; which leaves the model (identified) free 

fit2 <- cfa(hs.model, data=HolzingerSwineford1939, std.lv = TRUE)
fit2

# No difference 

summary(fit)
summary(fit1)
summary(fit2)

Method - 2: Non-standard method
-------------------------------
  
It is user responsibility to specify correct model. No automatic handling. 

hs.model.full <- '# Latent variables

                  visual =~ 1*x1+x2+x3
                  textual =~ 1*x4+x5+x6
                  speed =~ 1*x7+x8+x9

                  # Residual variances (observed)
                  
                  x1 ~~ x1
                  x2 ~~ x2
                  x3 ~~ x3
                  x4 ~~ x4
                  x5 ~~ x5
                  x6 ~~ x6
                  x7 ~~ x7
                  x8 ~~ x8
                  x9 ~~ x9

                  # Factor variances
        
                  visual ~~ visual
                  textual ~~ textual
                  speed ~~ speed

                  # Factor covariances

                  visual ~~ textual + speed
                  textual ~~ speed'

fit4 <- lavaan(hs.model.full, data = HolzingerSwineford1939)






#===================
# SEMPLOT
#===================


#----------------------------------------------
# Transition from LAVAAN to SEM and vice versa
#----------------------------------------------

model.lavaan <- semSyntax("fit_object", "lavaan")
model.lavaan

model.sem <- semSyntax("fit_object", "sem") # Now you will get the model in
# SEM format which you can use while working with SEM. 
model.sem


