# simulation of data frame
df_obj <- data.frame(a = 1:10, b = letters[1:10])
c <- LETTERS[1:10]

# cbind 
cbind(df_obj, c)
df_2 <- cbind(df_obj, c)
df_obj$c <- c

# rbind 

dim(df_obj)
rbind(df_obj, c(11, 'h'))
df_obj[11, ] <- c(11, 'h', 'H')

## packages 

ls('package:base')
grep('mean', ls('package:base'))
ls('package:base')[713]

ls('package:stats')[340]
grep('rbinom', ls('package:stats'))

pcks <- installed.packages()
length(pcks)
typeof(pcks)
class(pcks)
dim(pcks)
head(pcks)

install.packages('tmvnsim')
install.packages('psych')

library(psych)
detach('package:psych')
