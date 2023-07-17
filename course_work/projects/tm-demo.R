library(tm) #load text mining library

im <- read.csv(file.choose())
names(im)
im_abs <- im["Abstract"]
length(t(im_abs))

im_corp <- VCorpus((VectorSource(t(im_abs))))
abstracts_corp <- tm_map(im_corp, stripWhitespace)
abstracts_corp <- tm_map(abstracts_corp, content_transformer(tolower))                          
abstracts_corp <- tm_map(abstracts_corp, removeWords, stopwords("english"))
abstracts_corp <- tm_map(abstracts_corp, removeNumbers)
abstracts_corp <- tm_map(abstracts_corp, removePunctuation)
summary(abstracts_corp) 

im_dtm <-DocumentTermMatrix(abstracts_corp) 
tm::inspect(im_dtm)
im_dtm_dense <- tm::inspect(removeSparseTerms(im_dtm, 0.99))
im_dense_df <-data.frame(im_dtm_dense)
# findFreqTerms(adtm, 5)
dim(im_dense_df)
write.csv(im_dense_df, 'im.csv')

covidvac <- read.csv(file.choose())
names(covidvac)
covidvac_abs <- covidvac["Abstract"]
length(t(covidvac_abs))

covidvac_corp <- VCorpus((VectorSource(t(covidvac_abs))))
abstracts_corp <- tm_map(covidvac_corp, stripWhitespace)
abstracts_corp <- tm_map(abstracts_corp, content_transformer(tolower))                          
abstracts_corp <- tm_map(abstracts_corp, removeWords, stopwords("english"))
abstracts_corp <- tm_map(abstracts_corp, removeNumbers)
abstracts_corp <- tm_map(abstracts_corp, removePunctuation)
summary(abstracts_corp) 

covidvac_dtm <-DocumentTermMatrix(abstracts_corp) 
tm::inspect(covidvac_dtm)
covidvac_dtm_dense <- tm::inspect(removeSparseTerms(covidvac_dtm, 0.99))
covidvac_dense_df <-data.frame(covidvac_dtm_dense)
# findFreqTerms(adtm, 5)
dim(covidvac_dense_df)
names(covidvac_dense_df)

# for mediation

intersect(names(hc_dense_df), names(im_dense_df))
intersect(names(im_dense_df), names(covidvac_dense_df))
intersect(names(covidvac_dense_df), names(hc_dense_df))

union(union(names(hc_dense_df), names(im_dense_df)), names(covidvac_dense_df)) # total common variables
intersect(intersect(names(hc_dense_df), names(im_dense_df)), names(covidvac_dense_df)) # common variables for mediation

names(hc_dense_df)
names(im_dense_df)
names(covidvac_dense_df)

hc_dense_df[names(hc_dense_df) %in% names(im_dense_df)]
hc_dense_df[ names(im_dense_df)%in% names(hc_dense_df)]
im_dense_df[names(hc_dense_df) %in% names(im_dense_df)]
im_dense_df[names(im_dense_df) %in% names(hc_dense_df)]


hcdf <- read.csv(file.choose())
