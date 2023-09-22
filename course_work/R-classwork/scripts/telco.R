# input the data
telco_df <- read.csv(file.choose())
head(telco_df)

# making dataframe into factors

telco_df <- as.data.frame(unclass(telco_df),stringsAsFactors=TRUE)

telco_df['SeniorCitizen'] <- as.factor(telco_df$SeniorCitizen)

str(telco_df) # to show the structure of the database


nrow(telco_df) # number of rows in dataframe

ncol(telco_df) # same for columns

sum(is.na(telco_df)) # count the number of blank observations

telco_df <- na.omit(telco_df)
print(nrow(telco_df))
install.packages("ggplot2")


library(ggplot2)

ggplot(data = telco_df , aes(x = Churn,fill = Churn)) + geom_bar()  + geom_text(stat = 'count' , aes(label = paste("n = " , formatC(..count..))),vjust = -0.5) + theme_dark() + ggtitle("Number of customer churn") + theme(plot.title = element_text(hjust = 0.5))

g1 <- ggplot(data = telco_df , aes(x = MonthlyCharges)) + geom_histogram(aes(y = ..density..),color = "darkblue",fill="lightblue" , binwidth = 5) + theme_classic() + ggtitle("Histogram of MonthlyCharges") + theme(plot.title = element_text(hjust = 0.5))


g2 <- ggplot(data = telco_df , aes(x = MonthlyCharges)) + geom_boxplot(fill = "lightgreen") + theme_classic() + ggtitle("Boxplot of MonthlyCharges") + theme(plot.title = element_text(hjust = 0.5))





install.packages("cowplot")
library(cowplot)


print(plot_grid(g1,g2, ncol = 1, nrow = 2))



g1 <- ggplot(data = telco_df , aes(x = tenure)) + geom_histogram(aes(y = ..density..),color = "darkblue",fill="lightblue" , binwidth = 5) + theme_classic() + ggtitle("Histogram of tenure") + theme(plot.title = element_text(hjust = 0.5))
g2 <- ggplot(data = telco_df , aes(x = tenure)) + geom_boxplot(fill="lightgreen") + theme_classic() + ggtitle("Boxplot of tenure") + theme(plot.title = element_text(hjust = 0.5))
print(plot_grid(g1,g2, ncol = 1, nrow = 2))


ggplot(data = telco_df , aes(x = Churn , y = MonthlyCharges, fill = Churn)) + geom_bar(stat = "summary" , fun = "median")  +
  stat_summary(aes(label = paste(..y..)) , fun = median , geom = "text" , vjust = -0.5) + labs( y = "Median of MonthlyCharges") +
  ggtitle("Median monthly charges of customers") + theme_minimal() + theme(plot.title = element_text(hjust = 0.5))



ggplot(data = telco_df , aes(x = Churn , y = tenure, fill = Churn)) + geom_bar(stat = "summary" , fun = "median")  +
  stat_summary(aes(label = paste(..y..)) , fun = median , geom = "text" , vjust = -0.5) + labs( y = "Median of tenure") +
  ggtitle("Median tenure of customers") + theme_minimal() + theme(plot.title = element_text(hjust = 0.5))



ggplot(data = telco_df, aes(x = Churn,fill = InternetService)) + geom_bar(stat = "count",position = position_dodge()) + geom_text(stat = "count" , aes(label = paste("n = " , formatC(..count..))),vjust = -0.5 , position = position_dodge(0.9)) + ggtitle("Customer Churn by Internet Services") + theme_minimal() + theme(plot.title = element_text(hjust = 0.5))


ggplot(data = telco_df, aes(x = Churn,fill = Contract)) + geom_bar(stat = "count",position = position_dodge()) + geom_text(stat = "count" , aes(label = paste("n = " , formatC(..count..))),vjust = -0.5 , position = position_dodge(0.9)) + ggtitle("Customer Churn by Contract") + theme_minimal() + theme(plot.title = element_text(hjust = 0.5))


set.seed(99)
id <- sample(nrow(telco_df) , 0.8*nrow(telco_df))
train_df <- telco_df[id , ]
test_df <- telco_df[-id , ]

print(nrow(train_df))
print(nrow(test_df))


control <- trainControl(method="repeatedcv", number=10, repeats=3, sampling = "smote")

install.packages("caret")
library(caret)


knn_model <- train(Churn~ SeniorCitizen + Partner + Dependents + tenure  + 
                     MultipleLines + InternetService + OnlineSecurity + OnlineBackup + DeviceProtection + TechSupport + StreamingTV + StreamingMovies +
                     Contract + PaperlessBilling + PaymentMethod + MonthlyCharges, 
                   data=train_df, 
                   method='knn',
                   preProcess = c("center", "scale") ,
                   trControl=control)
knn_predict_test <- predict(knn_model , test_df)
confusionMatrix(knn_predict_test, test_df$Churn, positive = "Yes", mode = "everything")
