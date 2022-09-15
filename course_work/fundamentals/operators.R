# operators

# Assignment operators
x <- 5
print(x)
# x <<- 6 # global assignment

x = 9
print(x) # works but unconvensional

## global assignment

(function() {x <-10; cat('this is local x', x); x <<- 6})()
print(x)

# arithmetic operators

a <- 1; b <- 2

a + b
a - b 
a * b
a / b
a %/% b

# Relational Operators

a = 12; b = 23

a<b
a>b
a=b

a = 12; b = 23

a<=b
a>=b
a!=b

# Logical Operators

a=TRUE; b=TRUE

a & b
a && b
a | b
a || b

a=TRUE; b=FALSE

a & b
a && b
a | b
a || b

