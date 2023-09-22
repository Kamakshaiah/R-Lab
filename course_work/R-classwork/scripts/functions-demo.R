greetMe <- function(){
  os <- osVersion
  rv <- R.version['nickname']
  
  print(paste('Hi! You are using', rv, 'in', os))
}

greetMe <- function(fname, lname){
  print(paste('Hi', fname, lname))
}

makeEmail <- function(fname, lname, domain = NULL){
  print(paste(fname, lname, '@', domain, sep = ''))
}


  
