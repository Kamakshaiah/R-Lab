count_3 <- c(20, 50, 30)
# sum(count_3) # 100

pie(count_3, labels = paste0(count_3, "%"))

legend("topleft", legend = c("Theatre", "Series", "Movies"),
       fill =  c("white", "lightblue", "mistyrose"))