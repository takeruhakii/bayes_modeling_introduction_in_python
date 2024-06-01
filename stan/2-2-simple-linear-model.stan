data {
    int N;                  // サンプルサイズ
    vector[N] sales;        // 売り上げデータ
    vector[N] temperature;  // 気温データ
  
    int new_N;              // 予測データのサンプルサイズ
    vector[new_N] new_temperature;  // 予測データの気温
}

parameters {
    real Intercept;         // 切片
    real beta;              // 係数
    real<lower=0> sigma;    // 標準偏差
}

transformed parameters {
    vector[N] mu;
    mu = Intercept + beta * temperature;
}

model {
    // 平均Intercept + beta*temperature
    // 標準偏差sigmaの正規分布に従ってデータが得られたと仮定
    sales ~ normal(Intercept + beta*temperature, sigma);
}

generated quantities {
    vector[new_N] yhat;
    vector[new_N] muhat;
    for (i in 1:new_N) {
        muhat[i] = Intercept + beta * new_temperature[i];
        yhat[i] = normal_rng(muhat[i], sigma);
    }
}

