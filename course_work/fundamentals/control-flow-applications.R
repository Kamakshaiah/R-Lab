# Wage calculations

employeenames <- paste('e', 1:10, sep = '')

# dates <- as.Date(1:30)
# 
# hrs <- sample(0:24, 30, replace = T)
# mins <- sample(0:60, 30, replace = T)
# seconds <- sample(0:60, 30, replace = T)
# 
# times <- paste(hrs, mins, seconds, sep = ':')
# 
# datetimevar <- paste(dates, times, 'IST', sep = ' ')
# length(datetimevar)
# head(datetimevar)
# 
# employeelogin <- vector()
# length(employeelogin)
# 
# for (i in 1:length(datetimevar)){
#   employeelogin[i] <- as.POSIXct(datetimevar[i])
# }

# simulation

biometric <- function(n = 30){
  dates <- as.Date(1:n)
  
  hrs <- sample(0:24, n, replace = T)
  mins <- sample(0:60, n, replace = T)
  seconds <- sample(0:60, n, replace = T)
  
  times <- paste(hrs, mins, seconds, sep = ':')
  
  datetimevar <- paste(dates, times, 'IST', sep = ' ')
  length(datetimevar)
  head(datetimevar)
  
  out <- vector()
  
  for (i in 1:length(datetimevar)){
    out[i] <- as.POSIXct(datetimevar[i])
  }
  return(out) 
}

employeelogin <-biometric(n = 30)
employeelogout <- biometric(n = 30)

whrs <- as.POSIXlt(employeelogin - employeelogout)

# strsplit(strsplit(as.character(whrs[1]), split = ' ')[[1]][2], split = ':')[[1]][1]

extractTime <- function(datetimes, hrs = NULL, mins = NULL, secs = NULL){
  
  out <- matrix(NA, length(datetimes), 1)
  
  if (!is.null(hrs)){
    for (i in 1:length(datetimes)){
      out[i, 1] <- as.numeric(strsplit(strsplit(as.character(datetimes[i]), split = ' ')[[1]][2], split = ':')[[1]][1])
    } 
  } else if (!is.null(mins)){
      for (i in 1:length(datetimes)){
        out[i, 1] <- as.numeric(strsplit(strsplit(as.character(datetimes[i]), split = ' ')[[1]][2], split = ':')[[1]][1])
      }
  } else {
      for (i in 1:length(datetimes)){
        out[i, 1] <- as.numeric(strsplit(strsplit(as.character(datetimes[i]), split = ' ')[[1]][2], split = ':')[[1]][1])
      }
  }
  return(as.vector(out))
}
  
workhours <- extractTime(whrs, hrs = T)

calculateWages <- function(workhours, payperhour = NA){
  if(!is.na(payperhour)){
    wages <- workhours * payperhour
    totalwage <- sum(wages)
  }
  return(list(wages, totalwage))
}

calculateWages(workhours, payperhour = 450)[[1]] # total earning for 30 days
data.frame(dateandhours = whrs, hours = extractTime(whrs, hrs=T), wages = calculateWages(workhours, payperhour = 450)[[1]])

