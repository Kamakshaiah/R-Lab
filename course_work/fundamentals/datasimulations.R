simulateMultiVarNumData <- function(nv = 3, nr = 30){
  out <- matrix(sample(1:(nv * nr)), nr, nv)
  return(data.frame(out))
}

simulateMultiVarCatData <- function(sl, el, nr = NULL, nc = NULL, uc = T){
  if (is.null(nr) && is.null(nc)){
    print('Check args!')
  } else if(uc) {
    return(matrix(sample(LETTERS[sl:el]), nr, nc))
  } else {
    return(matrix(sample(letters[sl:el]), nr, nc))
  }
}

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

# testing

sedata <- simulateSEData()
studydata <- simulateStudyData()

finaldf <- data.frame(sedata, studydata)
names(finaldf)
summary(finaldf)
plot(finaldf)

# save 

summaryofdf <- sapply(finaldf, function(x) c(summary(finaldf), type = class(finaldf)))
write.csv(summaryofdf, 'summary.csv')

# xtabs(finaldf$gender ~ ., data = finaldf)
