#========================
# SESSION - I
#========================

In this session we will be concentration on fundamentals of R language namely:
  1. Console (version, license, session etc.)
  2. CRAN
  3. Package Architecture (CRAN)
  4. Installing packages
  5. Searching functions and datasets
  6. Data Management 
    6.1. vectors and factors (c operator, colon, seq, assign, scan)
    6.2. matrices (Arrays)
    6.3. data matrix; data frame
    6.4. Slicing and Indexing arrays
    6.4. Exporting data frames
    6.3. Improting data frames from Excel
    6.4. Copying data from clipboard

#========================
# FIRST THINGS
#========================

R.Version()
names(R.version)
R.version$os
R.version$system
R.version$nickname         # important
R.version$version.string   # important

#================================================
# R is powerful calculator? AND MORE THAN THAT!!!
#================================================

1+2
1+2==3
1+2==4
sin(pi/2)
cos(pi)
sin(pi/2)==-(cos(pi))
sin(1:10)
plot(sin(1:10), type = "b", col="red")
lines(cos(1:10), type = "b", col="blue")

# Let us make some certain trend data

plot(sin(1:50), type = "b", col="red")
abline(h=0) # Let me shift x-axis to "zero"

# let us calculate arithmetic mean

x <- round(rnorm(10)*100, 0)
age <- abs(x)
x
a.mean <- sum(age)/length(age)
a.mean

----------------------------
# Chisquare goodness of fit
----------------------------
# given a sample the sum of the squares of standard normal variates is 
# equal to chisquare value.

# Q ~ sigma_for_i_n_(z^2)

income <- abs(round(rnorm(10)*100, 0))
income
sum((income-mean(income))/sd(income)/sqrt(length(income)))
chisq.test(income)
sum((income-mean(income))/sd(income))


#------------------------------------
# CRAN
#------------------------------------

# http://cran.r-project.org/
# http://cran.r-project.org/web/packages/
# http://cran.r-project.org/web/packages/available_packages_by_name.html


#------------------------------------
# PACKAGES ARCHITECTURE
#------------------------------------

Visit "packages" at left side at CRAN repository. A package is a special 
device that has objects to perform analysis. Objects can be data sets or functions. 
As of now, there are aprox. 6000 packages at CRAN repository.

#------------------------------------
# Installation of packages
#------------------------------------

install.packages("ctv")
install.packages("sos")

library(ctv)
available.views()
install.views("your_package_of_interest")

# Some times I would like freak out my brain when I am drained at computer

#install.packages("rgl")
library(rgl)
mydf <- data.frame(x=rnorm(10), y=rnorm(10), z=rnorm(10))
plot3d(mydf, col="red")

# if you observe the data it is strictly normal right!

#------------------------------------
# How to perform analysis
#------------------------------------

Each package has certain special objects they are known as functions. There 
functions are used to perform data analysis. For instance; let us do 
correlation

age <- round(rnorm(10), 0)
income <- round(rnorm(10)*10000, 2)

mydf <- data.frame(age, income)

cor(mydf)

# But how do I know about performing correlation
# Fire your "sos" library installed before

library(sos)
my.search <- findFn("cor")

# Did you find a table of package information in browser (automatically 
# open after search completes

# Pick-up the package and try to install with our previous command (install.packages())


#-----------------------------------
# HELP & SEARCH MECHANISMS
#-----------------------------------

apropos("cor")

# It is easy to guess the function (else please quit data analytics)

help("cor") # There will be a nice help page right side the console 

# If you are in r-base you may see local help server opening help manual in browser

# If you are not able to figure it out in local server; then try:

??cor

# Some times we would like to try reading vignettes along with help; then try:

help.search("cor")

# you want to do it in "GOOGLE" way Go to http://rseek.org/ try in the search box


#------------------------------------
# DATA MANIPULATION AND ORGANIZATION
#------------------------------------
# VECTORS
#------------------------------------

Every thing in R is either a vector or factor. A matrix is a set of vectors and factors. 
All rows are individuals and columns are variables. So, vector is either a column or row

1. c operator

x <- c(1, 2, 3, 4)

2. colon 

x <- 1: 10 # just like linear series in Excel 

x <- rnorm(10) # If you want random values
x <- round(rnorm(10)*100) # Some time we need this operation for demonstration

3. seq()

seq(from = 1, to=10, length.out = 20) # Change "length.out ="
seq(1, 10, by=0.5) # with a fixed length

seq(1, 10, by = pi)

seq(10) # just like "1:10"
seq_len(10) # same as above

# if you want to know the order of this matrix

#----------------------------------------
# DATA MANIPULATION AND ORGANIZATION
#----------------------------------------
# MATRICES, ARRAYS, SPLICING AND INDEXING
#----------------------------------------

# There is very handy function in R to take care of data sets. That is 'matrix'
# just try:

help("matrix")

matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2, byrow = TRUE)
mymat <- matrix(c(1, 2, 3, 4, 5, 6), nrow=3, ncol=2, byrow = TRUE)
mymat

dimnames(mymat) = list(c("my.children", "her.children", "other.children"), c("myself", "herself"))
mymat

# Let me see if my children are different from her children

fisher.test(mymat)

#---------------------------------------------
# How to manage missing values
#---------------------------------------------

mymat <- matrix(round(rnorm(100)*10, 0), 10, 10)

#mymat <- abs(mymat)

mymat[, 2] <- "NA"
mymat

# class(mymat)

mymat[, -2] # List-wise deletion

mymat[1, ] <- "NA"
mymat
mymat[-1, -2] # Pair-wise deletion

# complete cases

mymat <- matrix(1:16, 4, 4)
mymat
class(mymat)
is.numeric(mymat)

mymat <- mymat[1, ] <- "na"

mymat <- as.data.frame(mymat) # observe the change of row names and columns names
names(mymat)

mymat[1, ] <- NA # We need to give without quotes
is.na(mymat)

mymat
na.omit(mymat)
na.exclude(mymat) # Both work in same fashion

# Handling missing dat in Statistics 

mean(mymat[1,])
mean(mymat[2,])

mean(mymat$V1)
mean(mymat$V1, na.rm = TRUE)

cor(mymat)
cor(mymat, use="complete.obs")
cor(mymat, use="pairwise")

# For more information on missing data visit: http://www.ats.ucla.edu/stat/r/faq/missing.htm

#-----------------------------------------------------------------------------
# EXPORTING DATA FRAMES
#-----------------------------------------------------------------------------

apropos("write")

# From the list I can find a couple of commands I guess useful to me

help("write.csv")

mydf <- data.frame(x = rnorm(10), y = rnorm(10), z = rnorm(10))
mydf

write.table(mydf, "mydf.xls") # Alternatively try with other formats like odt, ods, doc, docx etc. 

# Try with ods (it is better than xls)
# Go to documents you may find an "XLS" file you may open and check the data,

# when you open the file you may not find data values appropriately arranged in cells
# Try the following command 

write.csv(mydf, "mydf.csv") # Be careful you may not choose format freely

#--------------------------------
# IMPORTING DATA FILES
#--------------------------------

# Although R supports many formats, it is advisable to import as csv file. 

read.csv(file.choose())

# For other format read package "foreign"

#----------------------------------
# Copying data from clipboard
#----------------------------------

apropos("clip")

# Open data file copy to clipboard then perform the following action

mydf <- readClipboard(, sep="\t")
class(mydf)
mydf <- as.data.frame(mydf)
class(mydf)
edit(mydf)

# The data appears to be gibberish; if you observe the data it has a text string 
# \t" this is know as escape sequence. To make it meaningful you may try:

mydf <- read.table(file="clipboard", sep="\t", header = TRUE) # try with our "header" argument
mydf


