# GitHub Rules

GitHubでの作業ルールをまとめます。

## 基本ルール

- `main` への直接pushは避ける。
- 作業前にbranchを切る。
- 変更後はPull Requestを作る。
- CI確認後にmergeする。
- merge方式は原則squash mergeにする。

## 個人開発

- 軽微な変更は軽量PRでよい。
- 変更内容、確認方法、影響範囲は最低限書く。
- CIがない場合は、ローカルで実行した確認コマンドを書く。

## 本番影響がある場合

- レビュー必須にする。
- デプロイ手順と戻し方を書く。
- DB、認証、課金、外部API、公開URLへの影響を確認する。

## Branch名

- `feature/add-contact-form`
- `fix/header-layout`
- `chore/update-dependencies`
- `docs/update-readme`

## Commit Message

- `feat: add contact form`
- `fix: correct header layout`
- `chore: update dependencies`
- `docs: update README`

## PR本文テンプレート

```md
## 概要

- 

## 変更内容

- 

## 確認方法

- [ ] `npm run lint`
- [ ] `npm run build`
- [ ] ローカル画面確認

## 影響範囲

- 

## 補足

- 
```

## CC共通フロー試用

- ユーザーが「作業開始」「この作業を始めて」と言った場合は、git状態を確認し、`main` へ切り替え、`origin/main` を pull し、作業ブランチを作るか既存ブランチへ切り替える。
- ユーザーが「反映」「ここまで反映して」と言った場合は、変更確認、必要な検証、commit、push、PR作成または更新まで行う。
- PRがある場合は、必要に応じてGitHub ActionsのCI結果を確認する。
- mergeは原則GitHub側の自動マージに寄せる。
- ユーザーが「CIが通ったら自動マージまで設定して」と言った場合は、対象PR、必須CI、レビュー条件、rulesetを確認し、auto-merge有効化または`automerge`ラベル付与まで行う。
- merge方式は原則squash mergeにする。
- merge後は`main`へ切り替え、`origin/main`をpullし、merge済みローカルブランチを削除し、`git fetch --prune`を実行する。

### フック語の別名

- 「開始」「はじめたい」「作業開始」「この作業を始めて」「pullして始めて」は作業開始フローとして扱う。
- 「cloneして始めて」と言われた場合は、対象リポジトリをcloneし、`main`を最新化してから作業ブランチを作る。
- 「反映」「ここまで反映して」「pushしたい」「PRまで進めて」は反映フローとして扱う。
- 反映フローでは、現在のブランチと差分を確認し、必要な検証、commit、push、PR作成または更新まで進める。
