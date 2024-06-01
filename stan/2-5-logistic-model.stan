data {
    int N; // サンプル数
    int K; // 予測変数の数
    array[N] int y; // 観測された種子の発芽数
    matrix[N, K] X; // 予測変数のデータ
    array[N] int binom_size;

    int N_pred; // 予測用のサンプル数
    matrix[N_pred, K] X_pred; // 予測用の予測変数のデータ
    array[N_pred] int binom_size_pred;
}

parameters {
    vector[K] beta; // モデルのパラメータ
}

transformed parameters {
    vector[N] p; // 成功確率
    p = inv_logit(X * beta); // ロジスティック変換
}

model {
    y ~ binomial(binom_size, p); // 観測データのモデル
}

generated quantities {
    vector[N_pred] p_pred; // 予測用の成功確率
    array[N_pred] int y_pred; // 予測された発芽数

    for (i in 1:N_pred){
        p_pred[i] = inv_logit(X_pred[i] * beta); // 予測用の成功確率の計算
        y_pred[i] = binomial_rng(binom_size_pred[i], p_pred[i]); // 予測された発芽数のシミュレーション
    }
}