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
}

transformed parameters {
    vector[N] lambda;
    lambda = exp(X * beta);
}

model {
    y ~ poisson(lambda);
}

generated quantities {
    vector[N_pred] lambda_pred;
    array[N_pred] real y_pred;
    for (i in 1:N_pred){
        lambda_pred[i] = exp(X_pred[i] * beta);
        y_pred[i] = poisson_rng(lambda_pred[i]);
    }
}