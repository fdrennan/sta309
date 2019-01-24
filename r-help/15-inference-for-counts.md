# R Resources for Chapter 15 (Inference for Counts)
## Goodness-of-Fit Tests

The `chisq.test` function can be used with a vector of counts and a vector of expected proportions for a goodness of fit test.

	> counts <- c(102, 68, 30)  # make a vector with the data
	> # Chi-sq test
	> results1 <- chisq.test(counts, p=c(.6, .3, .1))
	> results1  # results

		Chi-squared test for given probabilities

	data:  counts
	X-squared = 8.7667, df = 2, p-value = 0.01248
	
The expected counts under the null hypothesis can be obtained 

	> results1$expected  # expected counts
	[1] 120  60  20
	
The critical value from the Chi-square distribution is obtained using the `qchisq` function with the 
area to left (1-alpha) and the degrees of freedom.

	> qchisq(.95,2)  # Critical value for alpha=0.05, df=2
	[1] 5.991465

## Test of Homogeneity or Independence

There are two ways you may want to use to enter a two-way table with count data.  If you download data from MyStatLab, 
you will need to remove column and row totals (if given) and save the data as a comma deliminated .csv file.  Once this
is done, you can use `read.csv` and the `as.matrix` functions to obtain the matrix.  The `row.names=1` option specifies
that the first column is used as row names and not as part of the matrix.

	> # Download data from MyStatLab, remove totals if given, and save file as .csv
	> example <- as.matrix(read.csv("~/Downloads/data12-3.csv", row.names=1))
	
RStudio is likely to give you a warning message which you can ignore.

	Warning message:
	In read.table(file = file, header = header, sep = sep, quote = quote,  :
  	incomplete final line found by readTableHeader on '~/Downloads/data12-3.csv'
	
You can check to see that the matrix looks the way you expect:

	> example
                       Less_than_30 X30.55 X56_or_older
	In-town_branch           21     39           40
	Mall_branch              29     51           20
	
To perform the Chi-squared test:

	> results3 <- chisq.test(example)
	> results3

	Pearson's Chi-squared test

	data:  example
	X-squared = 9.5467, df = 2, p-value = 0.008452
	
As before, you can see obtain the expected counts.	

	> results3$expected
                       Less_than_30 X30.55 X56_or_older
	In-town_branch           25     45           30
	Mall_branch              25     45           30

Alternatively, you can enter a matrix with the `matrix` function.  List the data column by column and 
specify the number of rows and columns using the `nrow` and `ncolumn` options.  Note that the matrix
obtained has exactly the same data as above, but default values are used for row and column names.

	> Alternative <- matrix(c(21, 29, 39, 51, 40, 20),  nrow=2,   ncol=3)
	> Alternative
	     [,1] [,2] [,3]
	[1,]   21   39   40
	[2,]   29   51   20
	
This exact same results are obtained using the matrix without row and column names:

	> results3 <- chisq.test(Alternative)
	> results3

		Pearson's Chi-squared test

	data:  Alternative
	X-squared = 9.5467, df = 2, p-value = 0.008452

	> results3$expected
     	     [,1] [,2] [,3]
	[1,]   25   45   30
	[2,]   25   45   30

