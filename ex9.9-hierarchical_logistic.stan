/* 9.9 hierarchical logistic regression */
data {
	int<lower=1> D;				/* number of predictors */
	int<lower=0> N;				/* number of data items */
	int<lower=1> L;				/* number of categories/levels */
	int<lower=0,upper=1> y[N];	/* outcome vector */
	int<lower=1,upper=L> ll[N];
	row_vector[D] x[N];			/* predictor 'matrix' */
}
parameters {
	real mu[D];				 /* each predictor has a mean */
	real<lower=0> sigma[D];	 /* each predictor has a variance */
	vector[D] beta[L];		 /* each level has a coefficient vector */
}
model {
	/* priors */
	mu ~ normal(0, 100);		/* means */
	for (l in 1:L)
		beta[l] ~ normal(mu, sigma);

	for (n in 1:N)
		y[n] ~ bernoulli_logit(x[n] * beta[ll[n]]);
}
