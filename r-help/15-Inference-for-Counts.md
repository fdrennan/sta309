# Goodness-of-Fit Tests

> cards <- c(102, 68, 30)  # make a vector with the data
> # Chi-sq test
> results1 <- chisq.test(cards, p=c(.6, .3, .1))
> results1  # results

	Chi-squared test for given probabilities

data:  cards
X-squared = 8.7667, df = 2, p-value = 0.01248

> results1$expected  # expected counts
[1] 120  60  20
> qchisq(.95,2)  # Critical value for alpha=0.05, df=2
[1] 5.991465

# Test of Homogeneity or Independence

> # Download data from MyStatLab, remove totals if given, and save file as .csv
> example <- as.matrix(read.csv("~/Downloads/data12-3.csv", row.names=1))
Warning message:
In read.table(file = file, header = header, sep = sep, quote = quote,  :
  incomplete final line found by readTableHeader on '~/Downloads/data12-3.csv'
> example
               Less_than_30 X30.55 X56_or_older
In-town_branch           21     39           40
Mall_branch              29     51           20
> results3 <- chisq.test(example)
> results3

	Pearson's Chi-squared test

data:  example
X-squared = 9.5467, df = 2, p-value = 0.008452

> results3$expected
               Less_than_30 X30.55 X56_or_older
In-town_branch           25     45           30
Mall_branch              25     45           30

> # Alternatively, list data column by column and specify the number of rows and columns
> Alternative <- matrix(c(21, 29, 39, 51, 40, 20),  nrow=2,   ncol=3)
> Alternative
     [,1] [,2] [,3]
[1,]   21   39   40
[2,]   29   51   20
> results3 <- chisq.test(Alternative)
> results3

	Pearson's Chi-squared test

data:  Alternative
X-squared = 9.5467, df = 2, p-value = 0.008452

> results3$expected
     [,1] [,2] [,3]
[1,]   25   45   30
[2,]   25   45   30