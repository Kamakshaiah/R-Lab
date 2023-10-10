# anova

gender <- sample(c('male', 'female'), 30, replace = T)
salary <- round(runif(30, 10, 100))

table(as.factor(gender))

chisq.test(table(as.factor(gender))) # X-squared = 0.13333, df = 1, p-value = 0.715 - fit
table(cut(salary, c(0, 50, 100)), gender)

mean(salary) # [1] 53.43333
t.test(salary) # good

chisq.test(table(cut(salary, c(0, 50, 100)), gender)) # depends and good for further analysis

gender_salary_data <- cbind.data.frame(gender = gender, salary = salary)

# anova(tapply(salary, gender, mean)) # does not work

aov(salary ~ gender, data = gender_salary_data)
summary(aov(salary ~ gender, data = gender_salary_data)) # equalent of anova()

anova(lm(salary ~ gender, data = gender_salary_data))
