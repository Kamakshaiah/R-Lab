x <- c(1:10)
print(x)
y <- 11:20
print(y)
c(x, y)
z <- c('a', 'b', 1:10)

age <- seq(20, 100, length.out = 10)
age <- sample(20:100, 10, replace = T)

print(x)
typeof(x)

age <- c( 23, 34, 45, 32, 34, 65, 87)
age

age <- c(46, 22, 21, 24, 23, 22, 16, 24, 21, 22, 25, 25, 22)
age
salary <- c(23, 34, 45, 54, 32, 34, 56)
salary

satisfaction <- c('no', 'not all', 'hate', 'dont know', 'of course', 'very much', 'okay')
satisfaction

attitude <- scan()

assign('salary', runif(20, 10, 100))
print(salary)


# non-numerical data vectors

gender <- sample(c('male', 'female'), 10, replace = T)
length(gender)
typeof(gender)
is.vector(gender)

is.factor(gender)
genderf <- as.factor(gender)

education <- sample(c('primary', 'secondary', 'higher'), 10, replace = T)
typeof(education)
is.vector(education)

is.factor(education)
educationf <- as.factor(education)
typeof(educationf)
is.factor(educationf)
is.vector(educationf)

cat_gene <- sample(c('a', 't', 'c', 'g'), 30, replace = T)
table(cat_gene)

cgratio <- function(){
  print('cg-ratio')
}