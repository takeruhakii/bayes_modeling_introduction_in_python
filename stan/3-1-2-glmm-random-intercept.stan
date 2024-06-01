data {
    int N;
    int K;
    int N_human;
    array[N] int y;
    matrix[N, K] X;
    array[N] int human_id;

    int N_pred;
    matrix[N_pred, K] X_pred;
    array[N_pred] int human_id_pred;
}

parameters {
    vector[K] beta;
    vector[N_human] r;
    real<lower=0> sigma_r;
}

transformed parameters {
    vector[N] lambda;
    for (i in 1:N){
        lambda[i] = exp(X[i] * beta + r[human_id[i]]);
    }
}

model {
        r ~ normal(0, sigma_r);
        y ~ poisson(lambda);
}

generated quantities {
    vector[N_pred] lambda_pred;
    array[N_pred] int y_pred;
    for (i in 1:N_pred){
        lambda_pred[i] = exp(X_pred[i] * beta + r[human_id_pred[i]]);
        y_pred[i] = poisson_rng(lambda_pred[i]);
    }
}