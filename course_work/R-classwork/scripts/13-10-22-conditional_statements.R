vec_obj <- 1:10
vec1_obj <- 1:3

vec_obj %in% vec1_obj

if (1 %in% vec_obj) print('there is one in vector')

x <- c('one', 'two', 'three')
print(x)

if ('three' %in% x) print('the element was found')

a <- 3; b <- 2
print(c(a, b))


if (a > b) { 
  cat(a, 'is greater than', b)
} else {
    cat(b, 'is greater than', a)
  }

c <- 1

findingBigNumber <- function(a, b, c){
  if ( a>b ) {
    cat('a is big')
  } else if (b >c){
    cat('b is bit')
  } else {
    cat('c is big')
  }  
}
# student results

marks <- round(runif(10)*100, )

marks <- c(12, 34, 54, 67, 79, 90)

for (m in marks){
  if (m < 40){
    print('failed')
  } else if(m >= 40 & m < 60){
    print('second class')
  } else {
    print('first class')
  }  
}

purchase_info <- round(runif(10)*100, )

for (i in purchase_info){
  if (i < 40){
    print('eligible for 1 credit point')
  } else if(i >= 40 & i < 60){
    print('eligible for 10 credit point')
  } else {
    print('eligible for 15 credit point')
  }  
}

employee_perf <- c('poor', 'fair', 'excellent')

employee_perf <- sample(c('poor', 'fair', 'excellent'), 10, replace = T)

for (i in employee_perf){
  if (i == 'poor' ){
    print('fire')
  } else if(i == 'fair'){
    print('eligible for 1 % on basic incentives')
  } else {
    print('eligible for 5 % on basic incentives')
  }  
}
