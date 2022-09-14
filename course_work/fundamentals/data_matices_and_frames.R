# matrices 

a <- matrix(1:4, 2, 2, byrow = T)
b <- matrix(1:4, 2, 2, byrow = T)
a; b

a * b # element wise multiplication
a %*% b # matrix multiplication

library(geometry)

dot(a, b) # sum of the products for columns
crossprod(a, b) == t(a) %*% b
tcrossprod(a, b) == a %*% t(b)

# 

persp(a)
persp(b)
persp(crossprod(a, b))

a <- matrix(1:100, 10, 10, byrow = T)
b <- matrix(1:100, 10, 10, byrow = T)
a; b


# data sets
## data marices

data_matrix <- matrix(1:20, 5, 4)
print(data_matrix)
head(data_matrix)
tail(data_matrix)

names(data_matrix) # NULL

## data frame

x1 <- round(runif(10)*100)
x2 <- round(runif(10)*100)
x3 <- round(runif(10)*100)

data_frame <- data.frame(x1, x2, x3)
print(data_frame)
head(data_frame)
tail(data_frame)

names(data_frame) # has names
