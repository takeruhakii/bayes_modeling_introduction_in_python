data {
    int N;
    int K;
    array[N] int y;
    matrix[N, K] X;

    int N_pred;
    matrix[N_pred, K] X_pred;
}

parameters {
    vector[K] beta;
    vector[N] r;
    real<lower=0> sigma_r;
}

transformed parameters {
    vector[N] lambda;
    lambda = exp(X * beta + r);
}

model {
        r ~ normal(0, sigma_r);
        y ~ poisson(lambda);
}

generated quantities {
    vector[N_pred] lambda_pred;
    array[N_pred] int y_pred;

    lambda_pred = exp(X_pred * beta);
        y_pred = poisson_rng(lambda_pred);
}