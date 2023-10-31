# data simulation

dataf <- data.frame(matrix(rnorm(120), 30, 4))
# names(dataf)
dim(dataf) # [1] 30  4

# number of NAs
sum(is.na(dataf)) #0

# simulating missing data
ridx <- c(1, 4, 6, 8, 5)
cidx <- c(2, 1, 3)

# for(i in ridx){
#   for(j in cidx){
#     print(c(i, j))
#   }
# }

for(i in ridx){
  for(j in cidx){
    dataf[i, j] <- NA
  }
}

# missing cases
sum(is.na(dataf)) #15
is.na(dataf)

# dataf

## imputation
fulldata <- dataf[complete.cases(dataf), ]
dim(fulldata) # [1] 25  4

## subsstition
sum(is.na(dataf)) # 15 values
dataf[is.na(dataf)] # only NAs
dataf[!is.na(dataf)] # other than NAs

### zero substition

dataf[is.na(dataf)]  <- 0

### mean substitution

mat <- matrix(rnorm(16), 4, 4)
mat
mean(mat)
mat[1, 1] <- NA
mean(mat) # now will be NA
mean(mat, na.rm = T) # now will be NA

mean(as.matrix(dataf), na.rm = T) # [1] -0.08181575
dataf[is.na(dataf)]  <- mean(as.matrix(dataf), na.rm = T)
dataf # mean substitution

### median substitution

median(as.matrix(dataf), na.rm = T) # [1] 0.2574737
dataf[is.na(dataf)]  <- median(as.matrix(dataf), na.rm = T)
dataf # median substitution

