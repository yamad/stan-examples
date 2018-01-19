/* logistic regression, non-vectorized */
data {
	int<lower=0> N;				/* number of data items */
	vector[N] x;				/* predictor vector */
	int<lower=0, upper=1> y[N];	/* outcome array? */
}
parameters {
	real alpha;
	real beta;
}
model {
	// equivalent, but slower, than previous example
	for (n in 1:N)
	    y[n] ~ bernoulli(inv_logit(alpha + beta * x[n]));
}
