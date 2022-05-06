#=================================================================================
# STRUCTURAL EQUATION MODELIING
#=================================================================================
# THEORY
#=================================================================================

# FORMULA
#======================================================
# SEM = FACTOR ANALYSIS + REGRESSION + PATH DIAGRAM   |
#======================================================
# SEM BASICS
#===================

# (1) Observed variables
# (2) Factors (Endogenous, Exogenous)
# (3) Error variables (error: between factor and observed variables, 
# rss: between exogenous and endogenous)

#-------------------
# Shapes (ttp://en.wikipedia.org/wiki/Greek_alphabet)
#-------------------
# Observed variable - Square
# Factor variables - circles
# Error variables - curved semi-circles

#-------------------
# Symbols
#-------------------

PSI - covariances between factors
Xi - Factors
Labmda - Effects or estimates (regression constants - beta)
X1, X2, .... or Y1, Y2, ..... - Observed variables
Delta - error variable

#--------------------------
# MODELS
#--------------------------

1. Psych
  1.1. Idependent factor model
  1.2. correlated factor model


#--------------------------------------
# Draw diagrams with any word application of your choice. 
#--------------------------------------

#-------------------------------------------------------------------------------
# SEM through R
#-------------------------------------------------------------------------------
# SEM package
#-------------------------------------------------------------------------------

There are different packages available to perform SEM in R. 
-----------------------------------------------------------
  
1. sem
2. lavaan
3. psych
4. semPLS

For plots 
-------------------
  
1. semPlot-semPaths()
2. sem - plot()
3. psych - structure.diagram()
4. semPLS - pathDiagram()





