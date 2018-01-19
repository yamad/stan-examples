// 9.6 multi-logit regression
// K possible outcomes, D predictors
data {
	int K;
	int N;
	int D;
	int y[N];
	vector[D] x[N];
}
parameters {
	matrix[K, D] beta;
}
model {
	for (k in 1:K)
		beta[k] ~ normal(0, 5);
	for (n in 1:N)
		y[n] ~ categorical(softmax(beta * x[n]));
}
