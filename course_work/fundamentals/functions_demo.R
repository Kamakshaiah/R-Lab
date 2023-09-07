# functions demo

## no argument

greetMe <- function(){
  os <- osVersion
  rv <- R.version['nickname']
  
  print(paste('Hi! You are using', rv, 'in', os))
}

### NULL argument

greetMe <- function(name=NULL){
  os <- osVersion
  rv <- R.version['nickname']
  
  print(paste('Hi!', name, 'You are using', rv, 'in', os))
}

greetMe()
greetMe('mk')

## with arguments

printInfo <- function(info=NULL){
  print(info)
}

printInfo('hi')
printInfo('hi, mk')
printInfo('hi, mk! How do you do?')

### arguments

makeEmail <- function(fname, lname){
  return(paste(fname, '.', lname, '@', 'gitam.edu', sep = ''))
}

makeEmail('kamakshaiah', 'musunuru')

### keyword arguments

makeEmail <- function(fname, lname, dname='gitam.edu'){
  return(paste(fname, '.', lname, '@', dname, sep = ''))
}

makeEmail('m', 'k')
makeEmail('m', 'k', dname='gitam.in')
# makeEmail('m', 'k', 'gitam.in') # also works

# Write functions for arithmetic calculations

addition <- function(x, y){
  return(x + y)
}

subtraction <- function(x, y){
  return(x - y)
}

multiplication <- function(x, y){
  return(x * y)
}

division <- function(x, y){
  return(x / y)
}

## testing

addition(1, 2)
subtraction(1, 2)
multiplication(1, 2)
division(1, 2)

# shapes

area_square <- function(s){
  return(s^2)
}

area_rectangle <- function(a, b){
  return(a * b)
}

area_triangle <- function(a, b){
  return(0.5* a * b)
}

area_square(2)
area_rectangle(2, 3)
area_triangle(2, 3)

# control flow
area <- function(s1=NULL, s2=NULL, type=NULL){
  if (type == 'square'){
    return(s1^2)
  } else if(type == 'rectangle'){
    return(s1*s2)
  } else if(type == 'triangle'){
    return(0.5*s1*s2)
  } else{
    print('check your inputs?')
  }
}

area(s1=2, type='square')
area(s1=2, s2=3, type='rectangle')
area(s1=2, s2=3, type='triangle')

## averages/means

arithmeticMean <- function(v){
  return(mean(v))
}

arithmeticMean(1:10)

geometricMean <- function(v){
  return(prod(v)^(1/length(v)))
}

geometricMean(1:10)

harmonicMean <- function(v){
  return(length(v)/sum(1/v))
}

harmonicMean(1:10)

### using switch statement 

averages <- function(v, type = NULL){
  out <- switch(type,
    'am'=arithmeticMean(v),
    'gm'=geometricMean(v),
    'hm'=harmonicMean(v)
  )
  return(out)
}

averages(1:10, 'am')
averages(1:10, 'gm')
averages(1:10, 'hm')

## dispersion

dispersion <- function(v, type = NULL){
  out <- switch(type,
                'var'=var(v),
                'std'=sd(v),
                'range'=range(v)
  )
  return(out)
}

dispersion(1:10, 'var')
dispersion(1:10, 'std')
dispersion(1:10, 'range')

## shape

moment <- function(v, type=NULL){
  out <- switch(type,
                'first'= sum(v - mean(v)),
                'second'=sum((v - mean(v))^2),
                'third'=sum((v - mean(v))^3),
                'fourth'=sum((v - mean(v))^4)
  )
  return(out)
}

skewness <- function(v){
  out <- (1/(length(v)-1)*moment(v, 'third')/sd(v)^3)
  return(out)
}

skewness(rnorm(10))

kurtosis <- function(v){
  out <- (1/(length(v)-1)*moment(v, 'fourth')/sd(v)^4)
  return(out)
}

kurtosis(rnorm(10))

# managing outputs
## use string formatting for outputs?

arithmeticaverage <- function(x){
  
  # calculations
  numer <- round(sum(x), 3)
  denom <- round(length(x), 3)
  out <- round(numer/denom, 3)
  
  #output 
  cat('sum', '\t', 'n', '\t', 'mean', '\n',
      numer, '\t', denom, '\t', out
      )
}

arithmeticaverage(rnorm(10))

arithmeticaverage <- function(x, output = NULL){
  
  # calculations
  numer <- round(sum(x), 3)
  denom <- round(length(x), 3)
  out <- round(numer/denom, 3)
  
  #output 
  
  if(is.null(output)){
    cat('sum', '\t', 'n', '\t', 'mean', '\n',
        numer, '\t', denom, '\t', out
    )
    
  } else{
    return(list(numer, denom, out))  
  }
}

arithmeticaverage(rnorm(10))
arithmeticaverage(rnorm(10), output=T)
arithmeticaverage(rnorm(10), output=T)[[3]] # for mean

# why list?
summaries <- as.data.frame(arithmeticaverage(rnorm(10), output=T))
colnames(summaries) <- c('s', 'n', 'xbar')
# View(summaries)
# edit(summaries)

## use NA for output argument in above code 

# NULL arguments

# composite function for arithmetic calculations

arithmeticcalc <- function(x, y, type = NULL){
  if(type == 'add'){
    return(x - y)
  } else if(type == 'sub'){
    return(x - y)
  } else if(type == 'mul'){
    return(x * y)
  } else if(type == 'div'){
    return(x / y)
  } 
}

arithmeticcalculator <- function(x, y, type = NULL){
  
  if(is.null(type)){
    print('check your args')
    
  } else if(type == 'add'){
    return(x + y)
  } else if(type == 'sub'){
    return(x - y)
  } else if(type == 'mul'){
    return(x * y)
  } else if(type == 'div'){
    return(x / y)
  } else {
    print('Good bye!')
  } 
}


# test function 

arithmeticcalculator(1, 2) # [1] "check your args"
arithmeticcalculator(1, 2, type = 'add') # it works 
arithmeticcalculator(1, 2, type = 'abc') # [1] "Good bye!"


