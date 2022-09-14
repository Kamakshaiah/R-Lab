summary <- function(arg1, arg2){
  out <- switch(
    arg1,
    'mean' = mean(arg2),
    'median' = median(arg2),
    'mode' = max(arg2)
  )
  return(out)
    
}

Summary <- function(arg1, arg2){
  if (arg1 == 'mean'){
    out <- mean(arg2)
  } else if(arg1 == 'median'){
    out <- median(arg2)
  } else if (arg1 == 'mode'){
    out <- max(arg2)
  }
  return(out)
}

# business use-case for customer 

evalCustomer <- function(type){
  out <- switch(
    type,
    'new'= 0.1,
    'occasional' = 0.2,
    'frequent' = 0.3
  )
  return(out)
}

payment <- function(total, type){
  out <- total * evalCustomer(type)
  return(out)
  }