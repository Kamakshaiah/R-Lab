#---------------------------
# PREREQUISITES
#---------------------------

# gsub()
# sapply()
# strsplit()
# ifelse()
# functions (concepts)

#---------------------------

# Go to https://apps.twitter.com/app/new 
# fill all the details
# Confirm your phone number (with a code cofirmation)
# Provide http://test.de/ (at website)
# API Key : YA0MUGeasgxuhJ0b3H7nwHr6i
# API Secret: TLg2TPBc2X3PPDJ7FYOWcHzIxVdUNjuoVl4RJY55MLUjeGwn6x
# Access Token: 120385238-MrPhak7ei3wm0xDd9iBpBPIW9zyeCEgp73KkBMki
# Access Token Secret: GA7sMgae4zv5JNSQdzZYdF3uOarDx2FqfJ4gVIHgYYl1b

library(devtools)
install_github("twitteR", username="geoffjentry")
library(twitteR)

# Set up keys

api_key <- "YA0MUGeasgxuhJ0b3H7nwHr6i"
api_secret <- "TLg2TPBc2X3PPDJ7FYOWcHzIxVdUNjuoVl4RJY55MLUjeGwn6x"
access_token <- "120385238-MrPhak7ei3wm0xDd9iBpBPIW9zyeCEgp73KkBMki"
access_token_secret <- "GA7sMgae4zv5JNSQdzZYdF3uOarDx2FqfJ4gVIHgYYl1b"
setup_twitter_oauth(api_key,api_secret,access_token,access_token_secret)

# while authenticating choose option 1.

# Test 
searchTwitter("iphone")

#----------------------------------------------------------------------------
# Pie diagram
#----------------------------------------------------------------------------

# Getting data

tweets = searchTwitter("Social Media", n=20)
edit(tweets)
class(tweets)

# transform the data

devices <- sapply(tweets, function(x) x$getStatusSource())

devices <- gsub("","", devices)
devices <- strsplit(devices, ">")

devices <- sapply(devices,function(x) ifelse(length(x) > 1, x[2], x[1])) # [/code]

# Ok now we have our devices can put them in a nice looking pie chart like this one.
# [code language="r"]

pie(table(devices))

#-------------------------------------------------------------------------------
# CLUSTER ANALYSIS
#-------------------------------------------------------------------------------

# OBJECTIVE: cluster Twitter followers by the ratio of their followers

# Better install them from github

require(devtools)
install_github('rCharts','ramnathv')
require(rCharts)

# We get our data in three steps. First we get the user object object, 
# then we get the followers and friends of this user and then we merge it to 
# a dataframe containing all these users and their information. 

user <- getUser("kamakshaiah") #Set the username

userFriends <- user$getFriends()
userFollowers <- user$getFollowers()
userNeighbors <- union(userFollowers, userFriends) # merge followers and friends

userNeighbors.df = twListToDF(userNeighbors) # create the dataframe

# Let us check our data frame

class(userNeighbors.df)
names(userNeighbors.df)
userNeighbors.df$followersCount
userNeighbors.df$id
userNeighbors.df

# Let us save in Excel format for study

getwd()
write.table(userNeighbors.df, "userneighbors.csv")

# Log transformation

userNeighbors.df[userNeighbors.df=="0"]<-1

# Create two columns "logFollowerCount", "logFriendsCount" and save 
# log transformation values in these columns

userNeighbors.df$logFollowersCount <-log(userNeighbors.df$followersCount)
userNeighbors.df$logFriendsCount <-log(userNeighbors.df$friendsCount)

# We are going to extract the relevant columns to another object named "kobject.log"

kobject <- data.frame(userNeighbors.df$logFollowersCount, userNeighbors.df$logFriendsCount)

# Let us explore the data as how many componets can be extracted with the 
# help of "screeplot"

mydf <- kobject
wss <- (nrow(mydf)-1)*sum(apply(mydf,2,var))
for(i in 2:10) wss[i] <- sum(kmeans(mydf,centers=i)$withinss)
plot(wss, type="b", col="red", xlab = "Number of clusters", ylab= "Within groups sum of squares")

# from the plot take number of componets (clusters) relevant for study
# in this chart it appears "4"

# Run the K Means algorithm, specifying 4 centers

user2Means <- kmeans(kobject, centers=4, iter.max=10, nstart=100)
names(user2Means) # Let us check column "cluster"
user2Means$cluster

# Add the vector of specified clusters back to the original vector as a factor

userNeighbors.df$cluster <- factor(user2Means$cluster)

# Plot the data
attach(userNeighbors.df)

library(cars) # for plotting data
scatterplot3d(logFollowersCount, logFriendsCount, cluster, color="red", pch=19)

# For more information on "scatter plots" visit 
# http://www.statmethods.net/graphs/scatterplot.html

# If you want to rotate the plot you may try "rgl"

library(rgl)
plot3d(logFollowersCount, logFriendsCount, cluster, col="red")

# Now you can rotate the plane in whichever direction you may like

library(cluster)
library(fpc)

clusplot(mydf, mydf$cluster, color=TRUE, shade=TRUE, lines=1, labels=4) 

# Change values of arguments


