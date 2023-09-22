for(i in 1:10){
  print(i)
}


x <- 1

while(x <=4){
  print(x)
  x <- x + 1
}

x <- 1

repeat {
  print(x)
  if (x > 4){
    break
  }
  
  x <- x + 1
}

rep(round(rnorm(1)), 10)

matrix(c(rep(0, 3), rep(round(rnorm(1)), 3), rep(0, 3)), 9, 1)


mat <- matrix(1:16, 4, 4)
mat1 <- matrix(rnorm(16), 4, 4)
cov(mat1)
det(mat1)

em <- eigen(mat1)$values

A <- matrix(c(13, -4, 2, -4, 11, -2, 2, -2, 8), 3, 3, byrow=TRUE)

ev <- eigen(A)
vectors <- ev$vectors
values <- ev$values
crossprod(vectors) # identity matrix
zapsmall(crossprod(vectors)) # pukka identity matrix

A %*% diag(3) %*% t(A)
A %*% t(A) # same

sum(values != 0)

sum(em != 0)
