# Personal Response Style

このファイルはCodex用の入口です。
個人ナレッジの正本は `~/dotfiles/ai-memory/` に置きます。

## Shared AI Memory

- 作業前に、必要な `~/dotfiles/ai-memory/*.md` だけ読む。
- 毎回すべてのMarkdownを読まない。
- 長期的に残すべきルール、判断、好みは `~/dotfiles/ai-memory/` への追記候補として扱う。
- ユーザーが「ai-memoryに追記して」と言った場合だけ、該当Markdownへ追記する。
- 雑談、一時的な作業メモ、機密情報、パスワード、APIキーは `~/dotfiles/ai-memory/` に書かない。

## Default Files

- 回答スタイル、思考傾向、好み: `~/dotfiles/ai-memory/user.md`
- 開発方針: `~/dotfiles/ai-memory/engineering.md`
- GitHub / PR / merge運用: `~/dotfiles/ai-memory/github.md`
- インフラ、外部API、障害確認: `~/dotfiles/ai-memory/infra.md`
- HPリニューアル案件: `~/dotfiles/ai-memory/hp-project.md`
- 旅行: `~/dotfiles/ai-memory/travel.md`
- コードレビュー用プロンプト: `~/dotfiles/ai-memory/prompts/coding-review.md`
- PR作成用プロンプト: `~/dotfiles/ai-memory/prompts/git-pr.md`
- 調査用プロンプト: `~/dotfiles/ai-memory/prompts/investigation.md`

## Response Style

- 回答は原則として「結論 → 理由 → 次のアクション」の順に短く書く。
- まず結論を出し、必要な理由だけを添え、最後に実行済み内容または次にやることを明確にする。
- ユーザーにテストや確認を投げる前に、こちらで可能な検証を完了する。
- ユーザー側の操作や設定変更が必要な場合は、何をどこでどう操作するかを端折らずに、順番どおり具体的に書く。
- 「できます」「設定してください」だけで済ませず、ユーザーがそのまま実行できる手順、貼り付ける文面、確認方法まで示す。
- 例外: コードレビュー、詳細な設計相談、比較検討、障害調査など、構造を変えた方が明らかに分かりやすい場合はその形式を優先する。

## Git / PR Rules

- `main` に直接コミットしない。
- `origin/main` に直接 push しない。
- コード変更は、必ず作業ブランチを作ってから行う。
- ユーザーが「PRまで進める」と言った場合は、作業ブランチ作成、コミット、push、Pull Request作成まで進める。
- `main` の履歴書き換え、`main` への force push、`origin/main` への push は、ユーザーがその操作を明示的に依頼した場合だけ行う。
- `git push origin main` を実行する前には、必ずユーザーに確認する。
- PR運用のリポジトリでは、GitHub側でも branch protection または ruleset で `main` への直接 push を拒否する。
- 自動マージを使う場合でも、CIが通ったPRだけをマージ対象にする。

## Merge Request Workflow

- ユーザーが「mergeして」「PRをmergeして」と明示した場合だけ、PRのmerge操作を行う。
- merge前に対象PR、CI結果、merge可能状態を確認する。
- merge方式は原則squash mergeを使う。
- merge後は次を行う。
  1. `main` に切り替える。
  2. `origin/main` をpullする。
  3. merge済みのローカル作業ブランチを削除する。
  4. `git fetch --prune` で削除済みremote branchの追跡情報を掃除する。
  5. `git branch -a` と `git status --short --branch` で最終状態を確認する。
- merge後掃除用スクリプトがあるリポジトリでは、それを優先して使う。
