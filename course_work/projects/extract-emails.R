# extracting emails from a text file

# https://sajankaundal.blogspot.com/2018/02/top-software-companies-hr-email-id-ht.html

hrsdata <- read.delim('D:/contacts/hrs.txt', header = F)
dim(hrsdata)[1]
hrsdata[[1]][1] # [1] "1 DPLM Software --- in.pune.careers@3dplmsoftware.com"

strsplit(hrsdata[[1]][1], split = ' --- ') # [[1]] [1] "1 DPLM Software"                   "in.pune.careers@3dplmsoftware.com"
strsplit(hrsdata[[1]][1], split = ' --- ')[[1]][2] # this is email

emails <- vector()
for (i in 1:dim(hrsdata)[1]){
  emails[i] <- strsplit(hrsdata[[1]][i], split = ' --- ')[[1]][2]
}
typeof(emails)
class(emails)
print(emails)

getwd()
setwd('D:/contacts')
write.csv(emails, 'hrs-extract.csv')
