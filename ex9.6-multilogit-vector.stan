// 9.6 multi-logit regression, more efficient
// K possible outcomes, D predictors
data {
	int<lower=2> K;				/* outcome classes */
	int<lower=0> N;				/* number of data items */
	int<lower=1> D;				/* number of predictors */
	int<lower=1,upper=K> y[N];	/* outcome vector */
	vector[D] x[N];				/* predictor vector array */
}
parameters {
	matrix[K, D] beta;
}
model {
	to_vector(beta) ~ normal(0, 5); /* weak prior */
	for (n in 1:N)
		y[n] ~ categorical_logit(beta * x[n]);
}
