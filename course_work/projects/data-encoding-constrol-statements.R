# vectorized if for processing student marks

grading <- function(marks){
  grades <- vector(length = length(marks))
  grades <- ifelse(studMarks > 40 & studMarks < 60, "B", ifelse(studMarks > 60 & studMarks < 75, "A", ifelse(studMarks > 75 & studMarks < 90, "A+", ifelse(studMarks > 90, "O", "F")) ))
  return(data.frame(marks = marks, grades = grades))
}

studMarks <- round(runif(30, 30, 80), 0)
grading(studMarks)

# coding gender based data (dichotomous data)

gender <- sample(c("male", "female"), 30, replace = TRUE)
salary <- round(runif(30, 30, 80), 0)

# polytomous data

haircolor <- sample(c("occassional", "frequent", "don't know"), 30, replace = TRUE)

dtdatacoding <- function(data){
  out <- vector(length = length(data))
  out <- ifelse(gender == "male", 1, 2)
 return(out)
}

datacoding <- function(data){
  if (is.factor(data)){
    n <- length(levels(data))
    cnt = 1
    cats <- levels(data)
    out <- vector(length = length(data))
    for (i in data){
      if (data == cats[]){
        
      }
    }
  }
  return(out)
}

for (i in gender){
  if (i == 'male'){
    print(1)
  } else {
    print(2)
  }
}

haircoding <- ifelse(haircolor == "occassional", 1, ifelse(haircolor == "frequent", 2, 3))
ha