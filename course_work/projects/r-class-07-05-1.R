if (FALSE){
  print('true')
} else {
  print('false')
}

printCustomer <- function(name){
  print(name)
} 

printRandomNumbers <- function(typeofthedist, n){
  if (typeofthedist == 'normal'){
    out <- rnorm(n)
    } else if(typeofthedist == 'uniform'){
      out <- runif(n, 1, n)
    } else if (typeofthedist == 'binomial'){
      out <- rbinom(n, n, 0.5)
    } else if (typeofthedist == 'poisson'){
      out <- rpois(n, 0.5)
    }
  return(out)
}

#usage
nrd <- printRandomNumbers('normal', 10)
hist(nrd, freq = FALSE); lines(density(nrd), col = 'red')

x <- TRUE
y <- FALSE
# AND table
print(x && x) # TRUE
print(x && y) # FALSE
print(y && x) # FALSE
print(y && y) # FALSE

# OR Table
print(x || x) # TRUE
print(x || y) # TRUE
print(y || x) # TRUE
print(y || y) # FALSE

switch(
  'mean', 
  'mean' = mean(1:10),
  'sd' = sd(1:10),
  'max' = max(1:10),
  'min' = min(1:10)
  
)

findSummary <- function(vec, stat){
  out <- switch(
    stat, 
    'mean' = mean(vec),
    'sd' = sd(vec),
    'max' = max(vec),
    'min' = min(vec)
  )
  return out
}