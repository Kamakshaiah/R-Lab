#=============================
# LAVAAN PACKAGE
#=============================

library("lavaan")

## The famous Holzinger and Swineford (1939) example

HS.model <- ' visual =~ x1 + x2 + x3
              textual =~ x4 + x5 + x6
              speed =~ x7 + x8 + x9 '

fit <- cfa(HS.model, data=HolzingerSwineford1939)

# Let us explore our "CFA" fit

summary(fit) 

# Try to interpret the data. We are free to interpret (n-1) parameters to a given
# factor

semPaths(fit)

# Let us tweek the plot

semPaths(fit, "Standardized", "Estimates")
semPaths(fit, "std", "est")

# We can change the appearance of the plot with the help of "style" arguments

semPaths(fit, "std", "est", style = "mx")
semPaths(fit, "std", "est", style = "lisrel")

#------------------------------
# From "psych" package
#------------------------------

library(psych)
lavaan.diagram(WiscIV.fit)

