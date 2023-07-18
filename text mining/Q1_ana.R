install.packages("tm")
library("tm")

q1file <- read.csv("C:/Users/Chandrika Bali/Downloads/scopus.csv")
names(q1file)
q1file_abs <- q1file["Abstract"]
length(t(q1file_abs))

mq1file_corp <- VCorpus((VectorSource(t(q1file_abs))))
abstracts_corp <- tm_map(q1file_corp, stripWhitespace)
abstracts_corp <- tm_map(abstracts_corp, content_transformer(tolower))                          
abstracts_corp <- tm_map(abstracts_corp, removeWords, stopwords("english"))
abstracts_corp <- tm_map(abstracts_corp, removeNumbers)
abstracts_corp <- tm_map(abstracts_corp, removePunctuation)
summary(abstracts_corp) 

q1file_dtm <-DocumentTermMatrix(abstracts_corp) 
tm::inspect(q1file_dtm)
q1file_dtm_dense <- tm::inspect(removeSparseTerms(q1file_dtm, 0.99))
q1file_dense_df <-data.frame(q1file_dtm_dense)
# findFreqTerms(adtm, 5)
dim(q1file_dense_df)
write.csv(q1file_dense_df, 'q1file.csv')
names(q1file_dense_df)

bigdata <- rowSums(data.frame(q1file_dense_df[, 2],(q1file_dense_df[, 4])))
bigdata

big_data_applications <- rowSums(data.frame(q1file_dense_df[, 11],(q1file_dense_df[, 1])))
big_data_applications

q1file_dense_df["bigdata"] <- bigdata
names(q1file_dense_df)
q1file_dense_df[,"bigdata"]

q1file_dense_df["big_data_applications"] <- big_data_applications
names(q1file_dense_df)
q1file_dense_df[,"big_data_applications"]

help("manova")

#q1fit <- manova(cbind(big,data,applications) ~  health+healthcare+performance+system, q1file_dense_df) 
#summary(q1fit)

q1fit <- manova(cbind(health,healthcare,performance,system) ~  big_data_applications, q1file_dense_df) 
summary(q1fit)

fit <- anova(q1fit)

q1df <- q1file_dense_df[,-c(11,12)]
names(q1df)

library("psych")
install.packages("GPArotation")
library("GPArotation")
fit <- psych::fa(cor(q1df), 2)
summary(fit)
fit
structure.diagram(fit)
