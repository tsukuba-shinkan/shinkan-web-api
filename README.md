# @tsukuba-shinkan/shinkan-web-api

[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/tsukuba-shinkan/shinkan-web-api/CI?label=CI&style=flat-square)](https://github.com/tsukuba-shinkan/shinkan-web-api/actions)
[![Codecov](https://img.shields.io/codecov/c/gh/tsukuba-shinkan/shinkan-web-api?style=flat-square)](https://codecov.io/gh/tsukuba-shinkan/shinkan-web-api)
[![Dependencies](https://img.shields.io/david/tsukuba-shinkan/shinkan-web-api?style=flat-square)](https://david-dm.org/tsukuba-shinkan/shinkan-web-api)
[![devDependencies](https://img.shields.io/david/dev/tsukuba-shinkan/shinkan-web-api?style=flat-square)](https://david-dm.org/tsukuba-shinkan/shinkan-web-api?type=dev)
[![License](https://img.shields.io/github/license/tsukuba-shinkan/shinkan-web-api?style=flat-square)](/LICENSE)
[![Imagine the future](https://img.shields.io/badge/Imagine%20the-future-%230bf?style=flat-square)](https://github.com/topics/imagine-the-future)

筑波大学 新歓 Web の API サーバ

## 開発

`.template.env`をコピーし、`.env`を作成して、`docker-compose`で起動します。

```sh
docker-compose up --build
```

初回起動時に DB がセットアップされます。

開発モードでは`src`以下を変更するとホットリロードされますが、それ以外の箇所（node_modules 含む）の変更は再実行（コンテナのリビルド）が必要です。

### それ以外のスクリプトの使用

手動でDBを構築し起動する場合は、ローカルマシンのNode.jsを使用して起動できます。DBの接続先は、`.env`の設定に依存します。

```sh
# ホットリロードを使用して起動する
npm run dev

# 本番環境用で使用する
npm run build
npm start
```

### テストの実行

```sh
npm test
```

## 本番環境での起動

アプリケーション用Dockerイメージは、環境変数`SHINKAN_IS_DEV`の存在を判定して起動モードを切り替えます。これは、`docker-compose.override.yml`に記述されているため、以下のようにすると本番モードで起動させることができます。

```
docker-compose -f docker-compose.yml -f docker-compose.prod.yml up
```
