# Question 1
# linearity is violated because there is a clear trend between x and the residuals
plot(data$x, resid(model)) # to plot resdiuals

# Question 2
plot(Coffee$pounds, Coffee$price)
cor(Coffee$pounds, Coffee$price)
cor(Coffee$price, Coffee$pounds) # order doesn't matter
# how to determine what on each axis: sales will almost always be on the y
# how to determine strong: judgement call. In this case, the clustering is pretty tight
# how to determine negative: as x increases, y decreases (generally)

# Question 3
model3 = lm(Temperature$`TAVG Ft Lauderdale`~Temperature$`TAVG Austin`)
summary(model)

# Question 4
# What are we looking for??"
model4 = lm(Coffee$pounds~Coffee$price)
summary(model4)
R**2 = 79.89
# what happens if we flip?
model4.1 = lm(Coffee$price~Coffee$pounds)
summary(model4.1)
#R**2 doesn't change! but be careful because the regression line does

# Question 5
model5 = lm(Coffee$pounds~Coffee$price)
summary(model5)
# y = 95.7 - 4.41(price/pound)
95.7 -4.41*(10.99)

# Question 6
# Number of eggs: Why not? can you have 1.1 eggs?
# Weight of the jelly beans: Yes, because you can have 1.1lbs, 1.11,1.111 etc
# Volume of four in a recipe: Yes, you can have those intermdiate values
# number of jelly beans: why not? can you have .1?

# Question 7
claims = c(0,1,2,3,4)
probs = c(.05,.15,.25,.45,.1)
ev = sum(claims*probs)
sq_dev = (claims-ev)**2
var = sum(sq_dev*probs)
st = sqrt(var)
st

# Question 8
# this one is tricky
# a binomial distribution will be for the number of successes given that the criteria are met:
# indepent trials
# Probability of success is constant
# only two options: success or failure

# Question 9
 100*.2 # .2 prob of success so p*n = ev
 sqrt(.2*.8*100)#sqrt(p*q*n) for binomial
# Question 10
# X mean = 3.5, sd = 1.7087
# Y mean = 4.5, sd = 2.2913
# what we want: sd(X+Y)
sqrt(1.7087**2 + 2.2913**2)
# remember not to add standard deviations!

# Question 11
# Blue mean = 12, sd = sqrt(6.02)
# Brown mean = 7, sd = sqrt(9.12)
# mean (X+Y):
12+7
# sd(X+Y):
sqrt(6.02+9.12)
# Question 12
# the min size is n*.134 = 10 what is n?
10/.134
# Question 13
pnorm(21,20,2,lower.tail = FALSE)
or 
1-pnorm(21,20,2)
# both of these options give the area under the curve to the right of the point

# Question 14
qnorm(.02,20,2)
# you want 2% area under the curve to the left

# Question 15
rate = 30/250
st15 = sqrt((.134*(1-.134))/250)
pnorm(rate,.134,st15)
or
num = .134*250
st15.1 = sqrt(250*.134*.866)
pnorm(30,num,st15.1)

# Question 16
View(cps)
qqnorm(cps$wage) # not linear
qqnorm(cps$educ) # not linear at all
qqnorm(cps$exper)# curvey at beg and end
qqnorm(cps$age) # pretty straight

hist(cps$wage) #right skewed
hist(cps$educ) #left skewed, maybe symmetric
hist(cps$exper) #right skewed
hist(cps$age) # symmetric

# Question 17
# what is undercoverage bias?
# as the name implies, when a group is undercovered in the sample

# Question 18
# what is the difference between a parameter and a statistic?
# what is the statistic in this case?
    # the sample proportion

# Question 19
rate19 = 42/150
st_error = sqrt((rate19*(1-rate19))/150)
z_star = qnorm(.975)
margin = z_star * st_error
rate19 + margin
rate19 - margin
or 
ci.prop <- function(p.hat, n, conf.level=0.95) {  
  critical.value <- qnorm(1 - (1 - conf.level) / 2)  
  standard.error <- sqrt(p.hat * (1 - p.hat) / n)  
  margin.of.error <- critical.value * standard.error  
  return(p.hat + c(-margin.of.error, margin.of.error))  
ci.prop(42/150,150)

# Question 20
ci.prop(54/120,120)
(.5390113 - .3609887) / 2
or 
rate20 = 54/120
st_error = sqrt((rate20*(1-rate20))/120)
z_star = qnorm(.975)
z_star * st_error

# Question 21
# in order to narrow the CI:
# decrease the confidence
# increase n 

# Question 22
# main idea for these kinds of problems:
# the CI talks about the proportion in question (not the ME)
# the CI is not absolute. Avoid statements like all samples, everyone etc

# Question 23 
ME = z_star * sqrt( p(1-p) / n)
ME / z_star = sqrt( p(1-p) / n)
(ME / z_star)**2 = p(1-p) / n 
p(1-p) * (z_star / ME)**2 = n
n = .25*((qnorm(.975))/.015)**2
