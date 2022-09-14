li1 <- c(1, 2, 3, 4)
li2 <- c(2, 3, 5, 6)

for(i in li1){
  for (j in li2){
    if (i == j){
      print(i)
    }
  }
}

goods <- list(groceries = c('gitem1', 'gitem2', 'gitem3'), cosmetics = c('citem1', 'citem2', 'citem3'), vegitables = c('vitem1', 'vitem2', 'vitem3'))
prices <- list(groceries = c(runif(3, 100, 1000)), cosmetics= c(runif(3, 100, 1000)), vegitables =  c(runif(3, 100, 1000)))
rebate <- list(groceries = 0.02, cosmetics = 0.2, vegitables = 0.01)

billing <- function(items){
  price = matrix(NA, length(items), 1)
  re = matrix(NA, length(items), 1)
  for (i in 1:length(items)){
    for(i in items){
      for (j in unlist(goods['groceries'])){
        if ( i == j){
          idx <- match(i, j)
          price[i] <- unlist(prices['groceries'])[idx]
          re[i] <- rebate['groceries']
          
        }
      }
      for (j in unlist(goods['cosmetics'])){
        if ( i == j){
          idx <- match(i, j)
          price[i] <- unlist(prices['cosmetics'])[idx]
          re[i] <- rebate['cosmetics']
          
        }
      }
      for (j in unlist(goods['vegitables'])){
        if ( i == j){
          idx <- match(i, j)
          price[i] <- unlist(prices['vegitables'])[idx]
          re[i] <- rebate['vegitables']
          
        }
      }
    }  
  }
  details <- na.omit(data.frame(unlist(price), unlist(re)))
  total_rebate <- crossprod(unlist(details[1]), unlist(details[2]))
  actual <- sum(details[1])
  total = actual - total_rebate
  return(list(items = details, actual = actual, total_reduction = total_rebate, payment = total))
}

items = c('gitem1', 'citem2', 'vitem3')
billing(items)

items = c('gitem3', 'citem2', 'vitem1')
billing(items)
