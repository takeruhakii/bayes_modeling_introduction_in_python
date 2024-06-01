# Rとstanではじめるベイズ統計モデリングによるデータ分析入門 pymc, pystanによる実装
「Rとstanではじめるベイズ統計モデリングによるデータ分析入門」のpymcとpystanによる実装です。一般化線形モデルから状態空間モデルまでの第3~5部についてpythonで実装しています。

## 環境構築
次の環境を想定しています。
- apple siliconのmac
- docker v25.0.3
dockerとpoetryでmacでもwindowsでも動くようにしたかったですが、m1 macではhttpstanのインストールが特殊なのでそちらに従っています。
windowsの方は普通にpystanをインストールすればhttpstanがインストールされると思います。

### dockerとpoetryのセッティング
次のサイトを参考にしてください。

https://docs.docker.jp/desktop/install/mac-install.html

https://qiita.com/Hakky_ball/items/213f42d0d03df13fd9e5

windowsの方はこちらを参考にしてください。

鋭意作成中

### ライブラリのインストール
次のコマンドを実行するだけです。
```
poetry install
```
