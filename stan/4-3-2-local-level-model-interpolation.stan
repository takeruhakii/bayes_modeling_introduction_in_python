data {
    int T;
    int len_obs;    // 観測値が得られた数
    vector[len_obs] y;
    array[len_obs] int obs_no;    // 観測値が得られた時点
}

parameters {
    vector[T] mu;
    real<lower=0> s_w;
    real<lower=0> s_v;
}

model {
    for (i in 2:T) {
        mu[i] ~ normal(mu[i-1], s_w);
    }
    for (i in 1:len_obs) {
        y[i] ~ normal(mu[obs_no[i]], s_v);
    }
}

generated quantities {
    vector[T] y_pred;
    for (i in 1:T) {
        y_pred[i] = normal_rng(mu[i], s_w);
    }
}