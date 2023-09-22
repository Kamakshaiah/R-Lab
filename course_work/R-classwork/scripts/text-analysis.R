# to convert text into data frame (unstructured data -> structured data)
# divide the text into words; make a frequency table 

x <- c(1L, 2L, 3L, 4L, 5L)
typeof(x)

txt <- "The Battle of Dupplin Moor, the first major battle of the Second War of Scottish Independence, was fought between supporters of King David II of Scotland and English-backed invaders supporting Edward Balliol (seal pictured) on 11 August 1332. Balliol and a largely English force of 1,500 landed in Fife and marched on Perth, the Scottish capital. The Scots, estimated to have been between 15,000 and 40,000 strong, raced to attack the English,"
typeof(txt)

words <- strsplit(txt, split = ' ')
wordstbl <- table(words)

wordsdf <- data.frame(wordstbl)
write.csv(wordsdf, 'wordsdf.csv')

dataset <- read.csv(file.choose())
head(dataset)

factanal(dataset, 1)
names(dataset)

scatter.smooth(dataset$x1, dataset$x2)
cor(dataset$x1, dataset$x2)

x <- 1:10
y <- 2:11

typeof(data)

df <- data.frame(data)
typeof(df)
class(df)

salesdata <- read.csv(file.choose())

typeof(salesdata)
class(salesdata)

mean(salesdata$south)
sd(salesdata$south)
scatter.smooth((salesdata$south))

salesdata[[1]]
