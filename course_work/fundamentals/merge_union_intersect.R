x = data.frame(StudentId = c(1:6), 
               Marks = c("70", "84", "90", "93", "80", "76"))

y = data.frame(StudentId = c(2, 4, 6, 7, 8), 
               city = c("Lahore", "Karachi", "Peshawar", "Quetta", "Multan")) 

z = merge(x, y, by = "StudentId")
z

union(x, y) # works
intersect(x$StudentId, y$StudentId)
z[intersect(x$StudentId, y$StudentId), ] #works

data.frame(union(x, y)) # does not work

y = data.frame(StudentId = c(2, 4, 6, 7, 8, 1), 
               city = c("Lahore", "Karachi", "Peshawar", "Quetta", "Multan", "Delhi")) 
colnames(data.frame(union(x, y))) <- c('id', 'marks', 'place') # does not work
         
dataf <- data.frame(union(x, y))
colnames(dataf) <- c('id', 'marks', 'place')

print(dataf)

