txt <- "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
txt
words <- strsplit(txt, split = ' ')
tbl <- table(words)
txtdf <- data.frame(tbl)
head(txtdf)
tail(txtdf)
names(txtdf) # for col names

txtdf[, 1] # prints first col
txtdf[, 2] # prints second col

mean(txtdf[, 2]); sd(txtdf[, 2]) # meand and standard deviation
summary(txtdf) # summary statistics

plot(txtdf[, 2]) # scatter plot
plot(txtdf[, 2]); text(txtdf[, 2], labels = txtdf[, 1]) # text plot

txtdf1 <- subset(txtdf, Freq != 1)
plot(txtdf1[, 2]); text(txtdf1[, 2], labels = txtdf1[, 1], pos = 2) # text plot for words not eq. to 1
