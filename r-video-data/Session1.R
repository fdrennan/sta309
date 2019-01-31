# Introductory R help Session #1 - 01-29-2019

# Downloading R & RStudio

# 309 R help pages

# R is a fancy calculator

3 + 5/8

5 * 3/5

# Assigning data to objects
x = 15
y = 10
x + y

# Creating vector/list
data = c(1, 2, 3, 4, 5, 10, 12, 43, 20)

sum(data^2)

data^2


# Reading in datafiles through import dataset option

# Command for reading in .csv datafiles

data1 = read.csv('data_session_01.csv')
?read.csv

# Commands required for HW2

# Five number summary
fivenum(data1$X)

# Mean
mean(data1$X)

# Median
median(data1$X)

# Standard Deviation
sd(data1$X)

# Boxplot
boxplot(data1$X)

# Histogram
hist(data1$X)
