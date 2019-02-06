#R Help Session 2 
#Homework 3

#Sections:
#Section 1: proportions review
#Section 2: barplot and pie manually - relative frequency included
#Section 3: two-way tables and prop tables
#Section 4: three-way tables
#Section 5: stacked barchart
#Section 6: mosaic plot

#--------------------------------------------------------

#Section 1: proportions review
#if there are 100 people and 87 of them are right-handed, the proportion is:
87/100 #.87 is the proportion
.87*100 #multiply by 100 for the percentage - 87%

#--------------------------------------------------------

#Section 2: barplot and pie manually - relative frequency included
#you'll also make bar charts with imported data; we'll do that in section 5
level <- c("1", "2", "3", "4", "5")
freq <- c(166, 36, 215, 55, 32)
barplot(freq, names.arg = level)

relfreq <- freq/sum(freq)
barplot(relfreq, names.arg = level)

pie(freq, labels = level)
#note: you can use pie after creating a table with a single variable

#--------------------------------------------------------

#Section 3: two-way tables and prop tables
#generic format: table <- table(data$x, data$y)
smokers<- read.csv("https://raw.githubusercontent.com/brianlukoff/sta309/master/hw-data/smokers.csv")
two.way <- table(smokers$Outcome, smokers$Smoker)
two.way
prop.table(two.way, 2) #note the 1,2 at the end changes what it does
(502/(230+502))*100 #percentage of non-smokers alive

#--------------------------------------------------------

#Section 4: three-way tables
#generic format: table <- table(data$x, data$y, data$z) # table with x and y /by/ z
three.way<-table(smokers$Outcome, smokers$Smoker, smokers$Age) #table with x, y, organized by z

three.way

327/(327+13) #proportion of non-smokers alive aged 18-44

#--------------------------------------------------------

#Section 5: stacked barchart
#generic format: barplot(prop.table, col = rainbow(5), legend = T)
bike <- read.csv("https://raw.githubusercontent.com/brianlukoff/sta309/master/hw-data/bikes.csv", row.names=1)

gender.freq <- table(bike$cyc_freq, bike$gender)
gender.prop <- prop.table(gender.freq, 2)
barplot(gender.prop, col = rainbow(5), legend = T)
#note: you can use barplot function after using the table function with a single variable

#--------------------------------------------------------

#Section 6: mosaic plot
mosaicplot(gender.freq, col = rainbow(2))
#area of boxes of the plot are proportional to the cell frequencies of the contingency table




