# Get authentication ID from facebook using https://developers.facebook.com
# Generate Token from https://developers.facebook.com/tools/explorer

# Give permissions
# Copy access token (Ex. CAACEdEose0cBAHk6NETZCkkvNe411KFkiDsobsCClaUg0PLzZAafaJYb4KiOelA3pZABAka0TYCgGw6Wplh9CvaY4ew29Aq8TTrFiau6ff49lRWGsFD0VMPZCUW1OlxwSfy9MYNWh1ZC8bymqD8IziDVIf4ZAsrD34chEOT6OqAK586VTNP1XM9RvI0bCYCZB2NlXaNeLOWug8Ko8hiEbnU7h3X6MUYWDsZD)

library(Rfacebook)
library(Rook)

# fb_oauth <- fbOAuth(app_id="695411157237888", app_secret="784fd378d155c767dccd44f1430abe2a",extended_permissions = TRUE)

token <- "CAACEdEose0cBANApmqFjZAfznOqdQWBRxMe6CWiZCMutal7spGDo2bIjq0ZAQjnauyZBpOTYzMYgyY992LQV9WZC92v4IEgUK0SjHFm6q9dgHFFf69vXWAAkFmCKFnmOJgVsK5o1vT2JjyZA6v7D4oZCblnN9d3sRkUuZCD9kpJ19Hd5hSrkVZCZCCzZBVGFFytjH59EYwfosqscFuJCNHfa53h"

#------------------------
# Try to get your details
#------------------------

me <- getUsers("me", token = token, private_info = TRUE)

# Let us check information about "users"

edit(me)
names(me)
me$name
me$id
table(me$gender)

#---------------------------------
# Try to get details of your users
#---------------------------------

users <- getUsers(f$id, token = token) # very very important
edit(users)
names(users)
users$gender

#---------------------------------
# For friends (Analyzing the network of friends)
#---------------------------------

fri <- getFriends(token, simplify = FALSE) # you get only few entries
fri <- getFriends("me", token) # to get all entries


# Alternative method

f <- getFriends("fri$name[1]", token)

edit(fri)

# help("substr")

#----------------------------------
# STATISTICAL ANALYSIS
#----------------------------------

names(fri)

# Locale details

table(substr(fri$locale, 1, 2)) 

# change the number 2 to 4 and see the change
# Also check by removing numbers

#-----------------------------------
# Categorical data analysis
#-----------------------------------
# Inter-gender differences
#-----------------------------------

table(fri$gender)
gen.loc <- table(fri$gender, fri$locale)

# Are intergender differences to locale are significant?

chisq.test(gen.loc)

# Do you find error message then try!

fisher.test(gen.loc)

# Are inter gender differences to likes are significant?
# First let me check if "like" is usable for analysis 

gen.like <- table(fri$gender, fri$likes)

chisq.test(gen.like)

# Let us see location

loc <- table(fri$location)
edit(loc)
class(loc)
loc <- as.data.frame(loc)

# Let us sort and find maximum and minimum 

newdf <- loc[order(Freq),]
newdf
plot(newdf)

# Gender vs. Location (much more interesting I suppose)

gen.loc <- table(fri$gender, fri$location)
t(gen.loc)
fisher.test(t(gen.loc))

# Ploting "Facebook ego network"

net1 <- getNetwork(fri$id, token, format="adj.matrix")
singletons <- rowSums(net)==0 # Friends who are friends with me alone

# Load "igraph" 
# Plot graph

require(igraph)
my_graph <- graph.adjacency(net[!singletons,!singletons])
layout <- layout.drl(my_graph,options=list(simmer.attraction=0))
plot(my_graph, vertex.size=2, vertex.label.cex=0.5, edge.arrow.size=0, edge.curved=TRUE,layout=layout)

#==================================
# OTHER PLOTS
#==================================
# Photo Network with Gephi
#----------------------------------
# taken from http://kateto.net/2014/04/facebook-data-collection-and-photo-network-visualization-with-gephi-and-r/
#----------------------------------

fb.net.mat <- getNetwork(token, format="adj.matrix")+0 # bool,+0 to get numeric
fb.net.el  <- as.data.frame(getNetwork(token, format = "edgelist"))


setwd("D:/work/R")
dir.create("FbImages")

# Image file name and local path stored here:
my.friends$picture.dld <- NA

# Download the images:
for (i in 1:dim(my.friends)[1]) {
  # Fb images appear to be mostly JPEGs, except for people
  # with no profile pics - for those we seem to get a default GIF
  pic.ext <- ".jpg"
  if(grepl(".gif$", my.friends$picture[i])) pic.ext <- ".gif"
  
  # We'll name files using people's full names plus file extension.
  
  my.friends$picture.dld[i] <-
    paste0("FBImages/", sub(" ", "_", my.friends$name[i]), pic.ext)
  
  # Some users have UTF-8 encoded names that don't work well as file names:
  
  if (Encoding(my.friends$name[i])=="UTF-8") {
    my.friends$picture.dld[i] <-
      paste0("FBImages/", "FbID_", my.friends$id[i], pic.ext) }
  
  download.file(my.friends$picture[i],  my.friends$picture.dld[i],  mode = 'wb')
}

# Visualizing the network with "Gephi"

colnames(fb.net.el) <- c("Source", "Target")
my.friends$ID <- my.friends$name
my.friends$image <- gsub("FBImages/(*.)", "\\1", my.friends$picture.dld)

write.csv(fb.net.el, file="Facebook-friend-EDGES.csv", row.names=F)
write.csv(my.friends, file="Facebook-friend-NODES.csv" row.names=F)

# Visualizing the network with "igraph"

require("png")
require("jpeg")
require("igraph")

fb.net <- graph.adjacency(fb.net.mat)

# Add node degree, node colors based on gender, and
# edge colors based on the color of the source node.
my.friends$degree <- degree(fb.net)
my.friends$color <- "gray45"
my.friends$color[my.friends$gender=="female"] <- "lightpink3"
my.friends$color[my.friends$gender=="male"]   <- "lightblue"
fb.net.el$color <- my.friends$color[match(fb.net.el$Source, my.friends$name)]

l <- layout.fruchterman.reingold(fb.net, niter=10000,area=vcount(fb.net)^2.3,
                                 repulserad=vcount(fb.net)^2.2)

png("Facebook-friends-net-IGRAPH.png", width = 2500, height = 2000)
plot(fb.net, vertex.size=my.friends$degree/20, vertex.label=NA,
     vertex.color=my.friends$color, edge.color=fb.net.el$color,
     edge.width=1, edge.arrow.size=0, edge.curved=0.3,  layout=l)
dev.off()


# Plot image network with "igraph" 

# Rescale the layout so it goes from -1 to 1
l <- layout.norm(l, -1, 1, -1, 1)

png("Facebook-friends-net-IGRAPH.png", width = 2500, height = 2000)
plot(fb.net, vertex.size=4, vertex.label=NA, edge.color=fb.net.el$color,
     vertex.shape="square",vertex.color="white", vertex.frame.color="white",
     edge.width=1, edge.arrow.size=0, edge.curved=0.2,  layout=l)

img.sc <- 0.03 #Image scaling
for (i in 1:dim(l)[1]) {
  img <- my.friends$picture.dld[i]
  img <- if(grepl(".jpg", img)) readJPEG(img) else "gray20"
  rasterImage(img, l[i,1]-img.sc, l[i,2]-img.sc, l[i,1]+img.sc, l[i,2]+img.sc)
}
dev.off()
detach(package:igraph)

# Visualizing the network with 'qgraph'

require("png")
require("qgraph")

png("Facebook-friends-net-2014-04-QGRAPH.png", width = 2500, height = 2000)
qgraph(fb.net.mat, images = my.friends$picture.dld, labels = F,
       borders = F, esize=0.1, curve=0.2, curveAll=T, edge.color="gray55")
dev.off()

detach(package:qgraph)