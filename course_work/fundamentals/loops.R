# loops

for(i in 1:10){
  print(i)
}

x <- 0
repeat{print(x); if(x >= 10) break; x = x + 1}

x <- 0
while(x <= 10){
  print(x)
  x = x + 1
}

# summaries

x1 <- round(runif(10, 20, 100))
x2 <- sample(c(1:5), 10, replace = T)
x3 <- round(rnorm(10))
data <- cbind(x1, x2, x3)
names(data)
head(data)

length(data)
dim(data)
data[, 1]

# colmeans
for (i in 1:dim(data)[2]){
  print(mean(data[, i]))
}

# rowmeans

mean(data[1, ])
     
for (i in 1:dim(data)[1]){
  print(mean(data[i, ]))
}

# frequency tables

gender <- factor(sample(c('male', 'female'), 10, replace = T))

factlevels <- levels(as.factor(gender))
factlevels[i]
for (i in 1:2){
  print(sum(gender == factlevels[i]))
}

x <- 0; y <- 0

for (i in 1:length(gender)){
  if (gender[i] == 'male'){
    x <- x + 1
  } else {
    y <- y + 1
  }
}

print(c(x, y))
print(c(male = x, female = y))

table(gender)

Table <- function(fact, levs = NULL){
  
  n <- length(fact)
  x <- 0; y <- 0
  
  for (i in 1:n){
    if (fact[i] == "male"){
      x <- x + 1
    } else {
      y <- y + 1
    }
  }
  
  print(c(x, y))
  
}

Table(gender)

