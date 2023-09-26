# to convert text into data frame (unstructured data -> structured data)
# divide the text into words; make a frequency table 

txt <- "The Battle of Dupplin Moor, the first major battle of the Second War of Scottish Independence, was fought between supporters of King David II of Scotland and English-backed invaders supporting Edward Balliol (seal pictured) on 11 August 1332. Balliol and a largely English force of 1,500 landed in Fife and marched on Perth, the Scottish capital. The Scots, estimated to have been between 15,000 and 40,000 strong, raced to attack the English,"
typeof(txt)

words <- strsplit(txt, split = ' ')
wordstbl <- table(words)

wordsdf <- data.frame(wordstbl)
# write.csv(wordsdf, 'wordsdf.csv')

names(wordsdf)
head(wordsdf)
tail(wordsdf)

wordsdf <- wordsdf[9:dim(wordsdf)[1], ]
min(wordsdf$Freq)
max(wordsdf$Freq)

wordssubset <- subset(wordsdf, Freq > 1)

filt_ <-wordsdf$Freq[with(wordsdf, c(wordsdf$Freq > 1))]
plot(wordssubset); text(wordssubset, labels = wordssubset[, 1]) 
is.numeric(wordsdf$Freq)

# abstracts 

path <- readline() # D:\Research\PAPERS\finance\cryptocurrency
pathch <- gsub('\\\\', '//', path)
filepath <- file.path(path, 'cryptocurrency-and-healthcare-scopus.csv')

cryptodata <- read.csv(filepath)

names(cryptodata)

cryptoabs <- cryptodata['Abstract']
dim(cryptoabs) # 215 abstracts

cryptoabs[1, ] # first abstract

firstabstractdata <- strsplit(cryptoabs[1, ], ' ')
class(firstabstractdata)
firstabstractdata[[1]][1] # first word/term
length(firstabstractdata[[1]]) # 226
firstabstractdf <- data.frame(table(firstabstractdata[[1]]))

plot(firstabstractdf); text(firstabstractdf, labels = firstabstractdf[, 1]) # make a note of the labels

frist_paper_wordstbl <- table(firstabstractdata[[1]])
frist_paper_wordsdf <- data.frame(frist_paper_wordstbl)
frist_paper_wordsdf_sub <- subset(frist_paper_wordsdf, Freq > 1)
dim(frist_paper_wordsdf_sub) # only 26 words or terms 
names(frist_paper_wordsdf_sub)

preps <- c('is', 'and', 'in', 'on', 'of', 'the', 'to', 'this', 'This', 'The', 'a', 'its', 'has', 'be', 'would')
frist_paper_wordsdf_sub[!frist_paper_wordsdf_sub$Var1 %in% preps, ]

frist_paper_sub_wordsdf <- subset(frist_paper_wordsdf_sub, !Var1 %in% preps)

plot(frist_paper_sub_wordsdf); text(frist_paper_sub_wordsdf, labels = frist_paper_sub_wordsdf[, 1]) # compare with previous plot

