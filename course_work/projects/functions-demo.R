add <- function(a, b){
  out <- a + b
  return(out)
} 
subtract <- function(a, b){
  out <- a - b
  return(out)
}
multiply <- function(a, b){
  out <- a * b
  return(out)
}
divide <- function(a, b){
  out <- a / b
  return(out)
}

a = 10; b = 5
c(add(a, b), subtrac(a, b), multiplicate(a, b), divide(a, b))

arithmeticCalc <- function(a, b, toc = 'add'){
  if (toc == 'add'){
    out <- add(a, b)
  } else if(toc == 'subtract'){
    out <- subtract(a, b)
  } else if(toc == 'multiply'){
    out <- multiply(a, b)
  } else {
    out <- divide(a, b)
  }
  return(out)
}

`++` <- function(a, b){
  return(a + b)
}

1 ++ 2
add(1, 2)

mat1 <- matrix(c(1, 2, 3, 4), 2, 2)
mat2 <- matrix(c(1, 2, 3, 4), 2, 2)

mat1 * mat2

body(add)

x <- 1

g <- function(){
  y <- 2
  c(x, y)
}
g()

factor = 0.5
b = 2.5
h = 1.5
area_of_a_triangle <- function(b, h){
 area <- 0.5 * b * h
 return(area)
}
area_of_a_triangle(b, h)

areaOfACirle <- function(r){
  area <- pi* r^2
  return(area)
}

