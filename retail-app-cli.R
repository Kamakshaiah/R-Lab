cat('Main menu:', '\n', 'Admin: 1', '\n', 'Items: 1',
    '\n', 'Customer: 1', '\n', 'Billing: 1', '\n', 'Exit: q')

readInput <- function(){
  inp <- sapply(x, function(x) x <- readline())
  return(inp)
}

inp1 <- readInput()
# print(inp1)

# inp1 <- sapply(x, function(x) x <- readline())

if (inp1 == 1){
  cat('Hi! Welcome to admin submenu. Do you like to setup userid and passwd?(y/n)')
  inp2 <- readInput()
  if (inp2 == 'y'){
    cat('User id:')
    userid = readInput()
    cat('Password:')
    passwd = readInput()
    logincred <- c(userid, passwd)

  }
}

print(logincred)
