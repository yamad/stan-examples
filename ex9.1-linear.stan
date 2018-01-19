// simple linear regression
data {
	int<lower=0> N;				/* number of data items */
	vector[N] x;				/* predictor vector (one predictor) */
	vector[N] y;				/* outcome vector */
}
parameters {
	real alpha;					/* intercept */
	real beta;					/* slope/coefficent */
	real<lower=0> sigma;		/* error scale */
}
model {
	/* univariate linear model */
	y ~ normal(alpha + beta * x, sigma);
}
