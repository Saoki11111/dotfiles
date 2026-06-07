# Claude Code Personal Instructions

このファイルはClaude Code用の入口です。
個人ナレッジの正本は `~/dotfiles/ai-memory/` に置きます。

## Load Shared AI Memory

通常の作業では、以下を前提にしてください。

- @~/dotfiles/ai-memory/user.md
- @~/dotfiles/ai-memory/engineering.md
- @~/dotfiles/ai-memory/github.md

必要に応じて、作業内容に近いファイルだけ追加で読んでください。

- インフラ、外部サービス、障害対応: @~/dotfiles/ai-memory/infra.md
- HPリニューアル案件: @~/dotfiles/ai-memory/hp-project.md
- 旅行相談: @~/dotfiles/ai-memory/travel.md
- コードレビュー: @~/dotfiles/ai-memory/prompts/coding-review.md
- PR作成: @~/dotfiles/ai-memory/prompts/git-pr.md
- 調査: @~/dotfiles/ai-memory/prompts/investigation.md

## Memory Policy

- `~/dotfiles/ai-memory/` を全AI共通の正本として扱う。
- Claude Codeのauto memoryは、Claude Code内だけの作業学習として扱う。
- 長期的に残すべきルール、判断、好みは `~/dotfiles/ai-memory/` への追記候補として提案する。
- ユーザーが「ai-memoryに追記して」と言った場合だけ、該当Markdownへ追記する。
- 雑談、一時的な作業メモ、機密情報、パスワード、APIキーは `~/dotfiles/ai-memory/` に書かない。

## External AI Usage

- 設計、調査、要件定義、技術選定、リスク洗い出しでは、必要に応じて Gemini CLI / GWS Deep Research など外部AIも併用する。
- 目的は、Claude Code単体の判断に寄せすぎず、複数AIの出力差、抜け漏れ、リスク、検証観点を比較すること。
- 外部AIの回答はそのまま採用せず、最後はClaude Codeが共通点、差分、リスクを整理して統合・判断する。
- コード編集、テスト、ローカル検証、差分確認、通常のスクリプト作成は原則Claude Code単体で進める。
- スクリプトの設計比較、安全確認、影響範囲確認が必要な場合だけ外部AIに壁打ちする。
- 外部AIを使った場合は、使ったこと、得られた要点、Claude Codeとしての最終判断、次のTODOを短く報告する。

## Update Destination

- 回答スタイル、思考傾向、好み: `~/dotfiles/ai-memory/user.md`
- 開発方針: `~/dotfiles/ai-memory/engineering.md`
- GitHub / PR / merge運用: `~/dotfiles/ai-memory/github.md`
- インフラ、外部API、障害確認: `~/dotfiles/ai-memory/infra.md`
- HPリニューアル案件: `~/dotfiles/ai-memory/hp-project.md`
- 旅行: `~/dotfiles/ai-memory/travel.md`
- プロジェクト固有ルール: `~/dotfiles/ai-memory/projects/<project>.md`
- 重要な判断ログ: `~/dotfiles/ai-memory/decisions/YYYY-MM-DD-topic.md`
