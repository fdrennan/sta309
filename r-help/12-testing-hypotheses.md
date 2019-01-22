# R resources for Chapter 12 (Testing hypotheses)

## Hypothesis test for one proportion

As with confidence intervals, we need the sample size, `n`, and the sample proportion, `p.hat`:

	> survey <- read.csv("~/Desktop/survey.csv")
	> n <- length(survey$voting)
	> k <- sum(survey$voting == "yes, in Texas"))  
	> p.hat <- k/n

Suppose we want to test ![H_0 : p=0.6](http://chart.apis.google.com/chart?cht=tx&chl=p=0.6) vs ![H_0 : p\\neq0.6](http://chart.apis.google.com/chart?cht=tx&chl=p<0.6)  (lower-tail test): 

	> p0 <- 0.6
	> SD.p <- sqrt(p0*(1-p0)/n)
	> ts.z <- (p.hat - p0)/SD.p
	> p.val.lower <- pnorm(ts.z)

Suppose instead that we instead want to test ![H_0 : p=0.6](http://chart.apis.google.com/chart?cht=tx&chl=p=0.6) vs ![H_0 : p>0.6](http://chart.apis.google.com/chart?cht=tx&chl=p>0.6) (upper-tail test). In this case,

	> p.val.upper <- 1 - pnorm(ts.z)
	
or
	
	> p.val.upper <- pnorm(ts.z, lower.tail=F)
	
Finally, if we want to test ![H_0 : p=0.6](http://chart.apis.google.com/chart?cht=tx&chl=p=0.6) vs ![H_0 : p\\neq0.6](http://chart.apis.google.com/chart?cht=tx&chl=p\neq0.6) (two-tailed test), we need to double the tail probability, so the P-value is either twice the lower P-value or twice the upper P-value.  One of these will be larger than 1 and the other is correct, so we can use the min function to choose the correct value and calculate the P-value as:

	> p.val.two <- min(2*pnorm(ts.z), 2*(pnorm(ts.z, lower.tail=F))

Instead of running through these calculations each time, we can also write our own function that automates this for us:

	ztest.p <- function(p.hat, n, p0) {  
	  SD <- sqrt(p0 * (1 - p0)/n)
	  ts.z <- (p.hat - p0) / SD  
	  p.val.lower <- pnorm(ts.z)  
	  p.val.upper <- 1 - pnorm(ts.z)   
	  list(test.statistic=ts.z,  
	       p.val.lower=p.val.lower,  
	       p.val.upper=p.val.upper,  
	       p.val.two=min(2*p.val.upper,2*p.val.lower)  
	  )  
	}
	
## Hypothesis test for one mean
	
Now let's test the hypothesis that average student gets 8 hours of sleep.  So the null hypothesis is ![formula](http://chart.apis.google.com/chart?cht=tx&chl=\mu=8)  and the test statistic is:

	> mu0 <- 8  
	> ts.t <- (sample.mean - mu0) / standard.error

And we can compute the p-value (assuming we want to run a two-sided test) as:

	> 2 * pt(abs(ts.t), lower.tail=F, df=n-1)

R also automates this process for us!  All we have to do is to use the `t.test` function, which does all of the work for us:

	> t.test(survey$sleep, mu=8)

For one sided tests, use `alternative="less"` or `alternative="greater"`.  In this case, ignore the confidence interval provided. 	
