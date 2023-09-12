simulateUniVarNumData <- function(n=10, rnd = NULL, type = NULL){
  
  # use for only normal and uniform distributions
  
  if(is.null(type)){
    if(is.null(rnd)){
      return(rnorm(n))    
    } else {
      return(round(rnorm(n), rnd))  
    }
  } else if(type == 'normal'){
    if(is.null(rnd)){
      return(rnorm(n))
    } else {
      return(round(rnorm(n), rnd))  
    }
  } else if(type == 'uniform'){
    if(is.null(rnd)){
      return(runif(n))
    } else {
      return(round(runif(n), rnd))  
    }
  }
}

# simulateUniVarNumData(rnd=2, type = 'uniform')
simulateUniVarNumData()

simulateBiVarNumData <- function(n=10, rnd = NULL, columnnames = c('var1', 'var2'), df = T, type = NULL){
  
  columnlist <- list(columnnames)
  
  for (i in 1:length(columnnames)){
    columnlist[[i]] <- simulateUniVarNumData(n=n, rnd = rnd, type = type)
  }
  
  if (df){
    out <- data.frame(columnlist)
    colnames(out) <- columnnames
    return(out)  
    } else {
      return(columnlist)  
    }
}

simulateBiVarNumData(n=10, rnd = 2, columnnames = c('var1', 'var2'), df = T, type = 'uniform')
  
simulateMultiVarNumData <- function(nv = 3, nr = 30){
  out <- matrix(sample(1:(nv * nr)), nr, nv)
  return(data.frame(out))
}

# simulateMultiVarNumData(nv = 4, nr = 20)

simulateMultiVarCatData <- function(sl, el, nr = NULL, nc = NULL, uppercase = T){
  if (is.null(nr) && is.null(nc)){
    print('Check args!')
  } else if(uppercase) {
    return(matrix(sample(LETTERS[sl:el]), nr, nc))
  } else {
    return(matrix(sample(letters[sl:el]), nr, nc))
  }
}

# simulateMultiVarCatData(1, 16, nr = 4, nc = 4, uppercase = T)

# columnnames = c('gender', 'education'); res = list(c('m', 'f'), c('p', 's', 'h'))
# columnlist <- list(columnnames)
# columnlist[[1]] <- sample(res[[1]], 30, replace = T)
# columnlist[[2]] <- sample(res[[2]], 30, replace = T)

simulateSEVariables <- function(n = 30, columnnames = c('gender', 'education'), res = list(c('m', 'f'), c('p', 's', 'h')), df = T){
  columnlist <- list(columnnames)
  for ( i in 1:length(columnnames)){
    columnlist[[i]] <- sample(res[[i]], n, replace = T)
  }
  if (df){
    out <- data.frame(columnlist)
    colnames(out) <- columnnames
    return(out)
  } else {
    return(columnlist)
  }
}

simulateSEVariables()
simulateSEVariables(n = 30, columnnames = c('gender', 'education', 'family'), 
                    res = list(c('male', 'female'), c('primary', 'secondary', 'higher'), c('combined', 'nuclear')), 
                    df = T)

simulateSEData <- function(n = 30, names = c('gender', 'salary', 'education', 'age', 'family'), res = list(c('m', 'f'), c(10, 100), c('primary', 'secondary', 'higher'), c(10, 100), c('joint', 'nuclear'))){
  nameslist <- as.list(names)
  nameslist[[1]] <- sample(res[[1]], n, replace = T)
  nameslist[[2]] <- round(runif(n, res[[2]][1], res[[2]][2]))
  nameslist[[3]] <- sample(res[[3]], n, replace = T)
  nameslist[[4]] <- round(runif(n, res[[2]][1], res[[2]][2]))
  nameslist[[5]] <- sample(res[[5]], n, replace = T)
  datafout <- data.frame(nameslist)
  colnames(datafout) <- names
  return(datafout)
}

# simulateSEData()

simulateStudyData <- function(n = 30, names = c('satisfaction', 'perception', 'attitude', 'awareness'), res = list(c('satisfied', 'dissatisfied'), c('ligical', 'intuitive'), c('positive', 'negative'), c('high', 'low'))){
  nameslist <- as.list(names)
  nameslist[[1]] <- sample(res[[1]], n, replace = T)
  nameslist[[2]] <- sample(res[[2]], n, replace = T)
  nameslist[[3]] <- sample(res[[3]], n, replace = T)
  nameslist[[4]] <- sample(res[[4]], n, replace = T)
  
  datafout <- data.frame(nameslist)
  colnames(datafout) <- names
  return(datafout)
}

# simulateStudyData()

simulateItems <- function(n=30, items = 3, itemnames = c('s1','s2','s3'), df = T){
  itemlist <- list(itemnames)
  for (i in 1:length(itemnames)){
    itemlist[[i]] <- sample(1:items, n, replace = T)
  }
  if (df){
    out <- data.frame(itemlist)
    colnames(out) <- itemnames 
    return(out)
  } else {
    return(itemlist)  
  }
}

# simulateItems(items = 5, itemnames = c('p1','p2','p3', 's1', 's2', 's3', 'a1', 'a2', 'a3'))

# QUICK FUNCTIONS

sedata <- simulateSEData()
studydata <- simulateStudyData()

finaldf <- data.frame(sedata, studydata)
names(finaldf)
summary(finaldf)
plot(finaldf)

# save summary

summaryofdf <- sapply(finaldf, function(x) c(summary(finaldf), type = class(finaldf)))
write.csv(summaryofdf, 'summary.csv')

# SOCIOECONOMICS

aands <- simulateBiVarNumData(rnd = 2, columnnames = c('age', 'salary'), type = 'uniform')
gef <- simulateSEVariables(n = 30, columnnames = c('gender', 'education', 'family'), 
                    res = list(c('male', 'female'), c('primary', 'secondary', 'higher'), c('combined', 'nuclear')), 
                    df = T)
data.frame(aands, gef)

# SCALED DATA

spa <- simulateItems(itemnames = c('s1', 's2', 'p1', 'p2', 'a1', 'a2'))
head(spa)

# MIXED DATA

sitems <- simulateItems(itemnames = c('s', 'p', 'a'))
data.frame(aands, gef, sitems)

