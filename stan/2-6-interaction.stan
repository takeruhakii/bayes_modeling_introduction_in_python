data {
    int N;
    int K;
    vector[N] y;
    matrix[N, K] X;

    int N_pred;
    matrix[N_pred, K] X_pred;
}

parameters {
    vector[K] beta;
    real<lower=0> sigma;
}

transformed parameters {
    vector[N] mu;
    mu = X * beta;
}

model {
    y ~ normal(mu, sigma);
}

generated quantities {
    vector[N_pred] mu_pred;
    array[N_pred] real y_pred;
    mu_pred = X_pred * beta;
    y_pred = normal_rng(mu_pred, sigma);
}