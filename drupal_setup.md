# docker drupal-memo

## 概要
- drupalを構築するdocker環境
- mdをpdfに出力できたらなおよし。
- 参照元手順
  - [dropfabrik/README_ja.md at master · blauerberg/dropfabrik · GitHub](https://github.com/blauerberg/dropfabrik/blob/master/README_ja.md)

### 実行手順
- mac-terminal上で
  - `git clone https://github.com/blauerberg/dropfabrik.git`
  - `cd dropfabrik`
  - `mkdir -p volumes/drupal`
  - `cd volumes/drupal`
  - `curl https://ftp.drupal.org/files/projects/drupal-8.7.0-rc1.tar.gz | tar zx --strip=1 -C .`
  - `docker-compose up`
- セットアップを省略したいのでコマンドでまとめて実行
  - `docker-compose exec php drush -y --root="/var/www/html" site-install standard --site-name="Drupal on Docker" --account-name="drupal" --account-pass="drupal" --db-url="mysql://drupal:drupal@db/drupal" --locale=ja`
  - 10分くらいかかる。
  - `おめでとうございます。Drupal[status]のインストールが完了しました。` と表示されたら初期セットアップ完了
  - ブラウザで
    - `http://localhost へアクセス`
    - 環境に応じて `docker-compose.override.yml`を修正する必要がある。
- Drupal 8の場合は以下も実行
  - `docker-compose exec php drush -y config-set system.theme admin bartik`
- ログイン(右上のログインボタンから)
  - ユーザ名: `drupal`
  - パスワード: `drupal`
- ユーザ管理は　ユーザー　→　役割　から設定する。

#### SEE ALSO
- [docker-syncを使ってみる - Qiita](https://qiita.com/reflet/items/ee15bf6b1b90a3a90905)
- [docker-compose コマンドまとめ - Qiita](https://qiita.com/wasanx25/items/d47caf37b79e855af95f)
- [tarで特定ファイルだけ取り出したり余分なディレクトリを作らないようにしたりなどのオプションメモ - Qiita](https://qiita.com/kawaz/items/46217733da8050132ce1)
- [tarコマンドについて詳しくまとめました 【Linuxコマンド集】](https://eng-entrance.com/linux-command-tar)
- [Drupalの高機能な権限管理 \| さくらのナレッジ](https://knowledge.sakura.ad.jp/5751/)
