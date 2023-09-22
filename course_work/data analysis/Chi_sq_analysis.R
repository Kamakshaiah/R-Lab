#==============================================================================
# CHISQUARE ANALYSIS
#==============================================================================

# you can import data from spreadsheets 

gender <- sample(c('male', 'female'), 30, replace = T)
education <- sample(c('educated', 'uneducated'), 30, replace = T)
family <- sample(c('nuclear', 'combined'), 30, replace = T)

tbl <- table(gender)
print(tbl)

# univariate
chisq.test(tbl) # X-squared = 0.13333, df = 1, p-value = 0.715

# bivariate

chisq.test(table(gender, education)) # X-squared = 0, df = 1, p-value = 1
chisq.test(table(gender, family)) # X-squared = 4.9512, df = 1, p-value = 0.02607
chisq.test(table(education, family)) # X-squared = 0.10242, df = 1, p-value = 0.7489

# multivariate

summary(table(education, family, gender)) # Chisq = 7.387, df = 4, p-value = 0.1168

# xtabs

sed <- data.frame(gender = gender, education = education, family = family)
dim(sed)
head(sed)

tbl <- xtabs(~gender+education, sed)
summary(tbl) # Chisq = 0.002424, df = 1, p-value = 0.9607

data.frame(ftable(tbl)) # for export
