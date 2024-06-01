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
    vector[N_pred] y_pred;
    for (i in 1:N_pred) {
        mu_pred[i] = X_pred[i] * beta;
        y_pred[i] = normal_rng(mu_pred[i], sigma);
    }
}