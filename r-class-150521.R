library(datasets)

View(airquality)
edit(airquality)

typeof(airquality)
class(airquality)

names(airquality)
head(airquality)
tail(airquality)
length(airquality)
dim(airquality)

help("airquality")

#with(airquality, mean(complete.cases(airquality["Solar.R"])))
#apply(airquality, 2, mean)

help("summary")
summary(airquality)

sdat <- read.csv("D:/Work/R Scripts/data/sample-data.csv")

typeof(surveydata)
class(surveydata)
names(surveydata)
surveydata["salary"]

surveydata[, 2] # age details
surveydata["age"] # age details
surveydata$age

with(surveydata, median(surveydata$salary))
apply(surveydata[, 6:14], 2, mean)
summary(surveydata)

table(surveydata['gender'])
table(surveydata['education'])
table(surveydata['family'])

tapply(surveydata$salary, surveydata$gender, var)
tapply(surveydata$age, surveydata$gender, mean)

mean(surveydata[, 2])

# Ho: education doesn't depend on gender (independent) (p > 0.05)
# Ha: education does depend on gender (p < 0.05)

table(sdat$gender, sdat$education)
out <- chisq.test(table(sdat$gender, sdat$education))

chisqTest <- function(var1, var2){
  mytab <- table(var1, var2)
  out <- chisq.test(mytab)
  
  if (out$p.value > 0.05){
    print("The variable of interest are independent")
  } else {
    print("The variables of interest are dependent")
  }
  return(c(out$statistic, out$p.value))
}

# numericToCat <- function(var, cats = 5){
#   out <- cats
#   ifelse(var > 20 & var <= 40, "0 to 20", ifelse(var > 40 & <= 60, "40 to 60", ifelse() ))
# }

salary <- sample(c("0 to 20", "20 to 40", "40 to 60"), length(sdat$salary), replace = TRUE)

cbind(sdat$gender, salary)

# Ho: salary doesn't depend on gender
# Ha: salary does depend on gender

chisqTest(sdat$gender, salary)

v <- 1:100

v <- vector(length = 100)

for (i in 1:100){
  v[i] <- 100
}

for (i in 1:100){
  v[i] <- 100 + rnorm(1)
}
