customers <- LETTERS[1:10]
pur_amt <- round(runif(10)*1000)

data_base <- data.frame(customers, pur_amt)
# data_base

add_transaction <- function(customer, amount){
  return(rbind(data_base, c(customer, amount)))
}

add_transaction('Z', 100)

add_customer <- function(customer){
  customers <- c(customers, customer)
  data_base <- rbind(data_base, c(customer, NA))
  data_base <<- data_base
  return(data_base)
}

# add_customer('Z')

# # finds 'A'
# subset(data_base, data_base['customers']=='A')
# cust_data <- subset(data_base, data_base['customers']=='A')
# cust_data['pur_amt']
# cust_data['pur_amt'] <-  100
# cust_data
# 
# data_base[with(data_base, customers == 'A'), ] # equal to subset
# # excludes 'A'
# data_base[!with(data_base, customers == 'A'), ]

add_amount <- function(customer, amount){
  if(customer %in% data_base[, 1]){
    cust_data <- subset(data_base, data_base['customers']==customer)
    cust_data['pur_amt'] = cust_data['pur_amt'] + amount
    data_base <<- data_base[!with(data_base, customers == customer), ]
    data_base <- rbind(data_base, cust_data)
  }
}

add_amount('Z', 100)

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

credits <- mapply(transaction, customers, pur_amt)

# data.frame(customers, pur_amt, credits)

cust_credit <- function(customer){
  cust_data <- subset(data_base, data_base['customers']==customer)
  return(cust_data['credits'])
}