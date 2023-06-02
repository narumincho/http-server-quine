# http-server-quine

[![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/narumincho/http-server-quine)

Quine は 自身のソースコードを出力するプログラムです.

出力先を HTTPサーバーのレスポンスにしたのが, この http-server-quine です.

# 実装言語

| language name | command                         |
| ------------- | ------------------------------- |
| dart          | `dart run ./dart/bin/dart.dart` |

# 参加方法

どしどし参加してほしい

1. このリポジトリをフォークする
2. [.gitpod.yml](.gitpod.yml) に言語のインストールコマンドを追加する
3. 言語の名前のディレクトリを直下に追加し, その言語で http-server-quine
   を実装する
4. Pull Request を作成する
5. [narumincho](https://github.com/narumincho) が動作するか確認
   調整しマージする.

# ルール

1. ポートは環境変数の PORT から読み取る. 読み取れなかった場合は 8080
2. ファイルの読み取りはしない
