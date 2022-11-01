customers <- LETTERS[1:10]
pur_amt <- round(runif(10)*1000)

data_base <- data.frame(customers, pur_amt)
# data_base

add_transaction <- function(customer, amount){
  data_base <<- rbind(data_base, c(customer, amount))
  return(data_base)
}

add_transaction('Z', 231)

add_customer <- function(customer){
  customers <- c(customers, customer)
  data_base <- rbind(data_base, c(customer, NA))
  data_base <<- data_base
  return(data_base)
}

add_customer('Z')

remove_customer <- function(customer){
  data_base <<- data_base[-with(data_base, grep(customer, data_base[, 1])),]
  return(data_base)
}

remove_customer('J')
remove_customer('Z')
# data_base

# # finds 'A'
# subset(data_base, data_base['customers']=='A')
# cust_data <- subset(data_base, data_base['customers']=='A')
# cust_data['pur_amt']
# cust_data['pur_amt'] <-  100
# cust_data
# 
data_base[with(data_base, customers == 'A'), ] # equal to subset
# excludes 'A'
data_base[!with(data_base, customers == 'A'), ]

add_amount <- function(customer, amount){
  if(customer %in% data_base[, 1]){
    cust_data <- subset(data_base, data_base['customers']==customer)
    if(is.na(cust_data['pur_amt'])) {
      cust_data['pur_amt'] <- amount
      
    } else {
      cust_data['pur_amt'] <- as.numeric(cust_data['pur_amt'][1, ]) + amount  
    }
    
    data_base <<- data_base[!with(data_base, customers == customer), ]
    data_base <<- rbind(data_base, cust_data)
    return(data_base)
  }
}

add_amount('Z', 100)
data_base

calculate_credits <- function(cust, amount){
  credit <- matrix(NA, 10, 1)
  for (i in 1:10){
    if (amount > 10){
      credit[i] <- amount * 0.01
    }
  }
  data_base['credits'] <- credit
  return(credit)
}

calc_credit <- function(customer){
  if(customer %in% data_base[, 1]){
    cust_data <- subset(data_base, data_base['customers'] == customer)
    if (cust_data['pur_amt'][1, ] > 100 & cust_data['pur_amt'][1, ] < 200){
      credit <- as.numeric(cust_data['pur_amt'][1, ]) * 0.1
      return(credit)
    } else if (cust_data['pur_amt'][1, ] > 200 & cust_data['pur_amt'][1, ] < 300){
      credit <- as.numeric(cust_data['pur_amt'][1, ]) * 0.2
      return(credit)
    } else if (cust_data['pur_amt'][1, ] > 300) {
      credit <- as.numeric(cust_data['pur_amt'][1, ]) * 0.3
      return(credit)
    }
    
    else {
      print('No credits possible...')
    }
  }
  # return(credit)
}

print(calc_credit('C'))
print(calc_credit('A'))
print(calc_credit('B'))
print(calc_credit('D'))

credits <- mapply(calc_credit, customers)

# data.frame(customers, pur_amt, credits)

cust_credit <- function(customer){
  cust_data <- subset(data_base, data_base['customers']==customer)
  return(cust_data['credits'])
}

for (i in 1:dim(data_set)[1]){
  print(paste[data_set[i, 1], data_set[i, 2]])
}