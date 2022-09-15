# source - https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Simple-manipulations-numbers-and-vectors
# attributes
z <- 0:9

digits <- as.character(z)
d <- as.integer(digits)

# Changing the length of an object

e <- numeric()
e[3] <- 17

alpha <- alpha[2 * 1:5]
length(alpha) <- 3
attr(z, "dim") <- c(10,10)

# class of an object

winter
unclass(winter)

# Ordered and unordered factors

state <- c("tas", "sa",  "qld", "nsw", "nsw", "nt",  "wa",  "wa",
           "qld", "vic", "nsw", "vic", "qld", "qld", "sa",  "tas",
           "sa",  "nt",  "wa",  "vic", "qld", "nsw", "nsw", "wa",
           "sa",  "act", "nsw", "vic", "vic", "act")

statef <- factor(state)
levels(statef)

# tapply() and ragged arrays

incomes <- c(60, 49, 40, 61, 64, 60, 59, 54, 62, 69, 70, 42, 56,
             61, 61, 61, 58, 51, 48, 65, 49, 49, 41, 48, 52, 46,
             59, 46, 58, 43)

incmeans <- tapply(incomes, statef, mean)

stdError <- function(x) sqrt(var(x)/length(x))
incster <- tapply(incomes, statef, stdError)


