# D:\Work\R\r-lab\R-Lab\course_work\fundamentals\datasimulations.R
path <- readline()
pathch <- gsub('\\\\', '/', path)
source(pathch)
inputdata <- simulateItems(items = 9, itemnames = c('s1','s2','s3','p1','p2','p3','a1','a2','a3'))

varmat <- var(inputdata)
n = length(varmat[upper.tri(varmat)])
v <- sum(varmat[diag(varmat)])
vbar <- v/n


vbar <- function(inputdata){
  varmat <- var(inputdata)
  n = dim(inputdata)[2]
  v <- sum(varmat[diag(varmat)])
  vbar <- v/n
  return(vbar)
}

cbar <- function(inputdata){
  covmat <- cov(inputdata)
  n = length(varmat[upper.tri(varmat)])
  c <- sum(varmat[upper.tri(varmat)])
  cbar <- c/n
  return(cbar)
}

calpha <- function(inputdata){
  v_ <- vbar(inputdata)
  c_ <- cbar(inputdata)
  k <- dim(inputdata)[2]  
  out <- k * c_ /(v_/(k-1)*c_)
  return(out)
}

calpha(inputdata)
