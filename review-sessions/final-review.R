# https://github.com/brianlukoff/sta309/tree/master/r-help

# Q1 #linear regression single variable
# concept: independent vs dependent
# scatter plot to explore
#HomePrice <- read.csv("E:/Dropbox/F_Disk/1_TA/2018fall/practice final/HomePrice.csv", stringsAsFactors=FALSE)
mod = lm( Price...000. ~ Square.Feet, data=HomePrice)
plot(HomePrice$Square.Feet, HomePrice$Price...000.)
abline(mod)
predict.lm(mod, list(Square.Feet=2300), interval="prediction")
# 417

# Q2 random variable
View(INVESTMENT)
x = INVESTMENT$`% Return`
prob = INVESTMENT$Prob
# get mean 
data.mean = sum(x*prob)
data.mean

# get variance
data.var = sum((x-data.mean)^2 * prob) 
data.sd = sqrt(data.var)
data.sd
# 10.0087

# Q3 the sample mean follow a normal distribution 
# mean is the population mean, sd is the sd/sqrt(n)
mean_ = 0.005
sd_ = 0.0012
sd.sample = sd_/sqrt(9)
x = 0.006
# above 0.006 will pay for the price
1-pnorm(x, mean_, sd.sample)
# 0.0062

# Q4 basic proability
# multiplication rule: when independent  
p = 0.528
p.miss = (1-p)^3
1-p.miss
# 0.8948


# Q5
# multiple regression problem
# slope tell the magnitude , sign tell the direction
mod = lm(Graduation.rate ~ Student.faculty.ratio+ Average.combined.SAT, data = colleges)
summary(mod)
# studetent faculty ratio, down by -0.73401
# average combined sat  up by 0.08406

# Q6 survey: 
# A: How many days a week do you use a bicycle to go from home to work?


# Q7
View(admissions)
table (admissions$Decision, admissions$Gender, admissions$Program)
c( (10/40), (5/20))
# A: There is no association between gender and admission decision in either program.
# p(result|male) = p(result|female)

engineering = subset(admissions, Program == 'Engineering')
english =  subset(admissions, Program == 'English')
engineer.table = table(engineering$Decision, engineering$Gender)

# conditional distribution given the gender p(result|gender)
prop.table(engineer.table,2)
barplot(prop.table(engineer.table,2),legend=T)

english.table = table(english$Decision, english$Gender)
prop.table(english.table,2)
barplot(prop.table(english.table,2),legend=T)


# Q8 margin of error 
# me = critical value * se
# se = sqrt(p.hat*(1-p.hat)/n)
# A: less, because the sample is now larger.

# Q9 not in the range of the sample data
# we predict a value of y from a given value of x even though the data has no x values that are nearby.


# Q10, hypothesis test for proportion. approximate to be normal distribution
p=0.35
n = 700
sd = sqrt(p*(1-p)/n)
p.hat = 0.33
pnorm(p.hat, p, sd) # one tail test 

# A: 0.134 

# Q11 linear regression assumption
model = lm( Price...000. ~ Square.Feet, data=HomePrice)
residuals <- residuals(model)  
# linearity
plot(HomePrice$Square.Feet, residuals)

# heteroscedasticity # not equally spread
plot(predict(model), residuals)
abline(0,0)
# fan shape, 
# A: Prediction of listing price will be less accurate when the home size is larger, because the residual plot shows increasing spread about the line.

# Q12 the meaning of confidence interval, only about the parameters
# A: We have constructed an interval using a procedure that will include the true mean 99% of the time

# Q13
# summary(Ticket_prices)
model = lm(`Receipts`~`Paid Attendance`+ `Shows`+`Avg Ticket Price`, data = Ticket_prices)
summary(model)
# A: Shows 

# Q14
hist(Views$`How many times did you watch the Anaconda music video by Nicki Minaj?`)
#boxplot(Views$`How many times did you watch the Anaconda music video by Nicki Minaj?`)
# A: skewed to the right

# Q15 two-sample t test
View(nox) # missing value in used car
new.car = nox$New
used.car = na.omit(nox$Used)
t.test(used.car,new.car,paired = F)
# A: p = 0.013

# Q16 paired t test. amelas
View(amylase)
t.test(amylase$new,amylase$standard, paired = T)
# A: interval is  (6.508017,12.491983)

# Q17 design hypothesis; live longer, 77 years
# A: It is a one tailed test about a mean.

# Q18 calculate the random variable given the propotion
# propotion = 0.02 
qnorm(0.02,8.3, 0.2)
# A: weight 7.9

# Q19 test assumpptions of linear regression 
View(GPA)
model = lm(`Units Sold`~`College GPA`, data=GPA)
residuals = residuals(model)
# linearity
plot(GPA$`College GPA`, residuals) # good

# heteroscedasticity 
plot(predict(model), residuals) # good
abline(0,0)

# normal condition
qqnorm(residuals) # sample size is so small 
abline(mean(residuals), sd(residuals)) # good
# 10*skewness^2 and 10*|kurtosis-3|
# 

#independence no need to worry about until for time series

# A: all of the required conditions are satisfied.

# Q20
model = lm(`Receipts`~`Paid Attendance`+ `Shows`+`Avg Ticket Price`, data = Ticket_prices)
summary(model)
confint(model,level=0.95)
# A: confint for paid attendance is 0.075 to 0.077

# Q21 type II error, fail to reject null when it is false
# power: reject null when it is false
# type I, fail to accept null when it is true
1-0.97 # power = 1-beta
# A: 0.03 

# Q22 
# p(c,s) = p(c)*p(s) if independent
0.03 == 0.2*0.12

# if independent then P(C|S) = P(C)
# P(C) = 0.2, P(S) = 0.12, P(C,S) = 0.03
# P(C|S) = P(C,S)/P(S) = 0.03/0.12 = 0.25


# disjoint, can occur at the same time
0.03/.12
# 
# A: C and S are not independent, nor are they disjoint. disjoint means P(c,s) = 0

# Q23 test if the slope is 1 (not 0)
# t statistics = (b1-1)/se
(0.997-1)/0.003549
# A: t = -0.8453085

# Q24 General multiplication rule
#p(f|d)=0.3, p(f) = 0.2, p(d)=0.64
# p(f,d) = p(f|d)*p(d) = 0.3*0.64 = 0.192
0.3*0.64
# A: 0.192

# Q25
# A: -0.3 min; intersect has no meaning





                                                                                                                                                                                                                                                                                                  



