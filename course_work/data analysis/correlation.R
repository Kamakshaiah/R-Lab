my.cor <- function(x, y){

if(is.numeric(x)){x <- x} else{x <- as.numeric(x)}  
  if(is.numeric(y)){y <- y} else{y <- as.numeric(y)}
  
  covar.xy <- cov(x, y)
  sd.x <- sd(x)
  sd.y <- sd(y)
  my.cor <- (covar.xy/(sd.x*sd.y))
return(my.cor)
  }