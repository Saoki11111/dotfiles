# Environments

個人環境と会社環境の使い分けをまとめます。

## 基本方針

- 個人用と会社用の `ai-memory` は混ぜない。
- 個人PCの `~/dotfiles/ai-memory/` は個人用の正本にする。
- 会社PCでは、会社用アカウントのprivate dotfiles配下に会社用 `ai-memory` を作る。
- 会社環境では、会社の機密情報、顧客情報、認証情報、APIキー、パスワードを書かない。
- 会社用メモリは、会社PC内で完結させる。

## 個人PC

- 端末: M1 MacBook Air
- メモリ: 8GB
- ストレージ: 256GB
- 用途:
  - 個人開発
  - 個人dotfiles
  - Claude Code / Codex向け個人ルール
  - 旅行、HP案件、個人の判断ログ
- メモリ置き場:
  - `~/dotfiles/ai-memory/`
- dotfiles連携:
  - `~/.claude/CLAUDE.md`
  - `~/.codex/AGENTS.md`

## 会社PC

- 端末: Windows + WSL環境
- メモリ: 16GB
- ストレージ: 256GB
- 用途:
  - 会社開発
  - 会社用Claude Code
  - 会社用dotfiles
  - 必要に応じてGemini CLI / Antigravity CLI連携
- メモリ置き場候補:
  - `~/dotfiles/ai-memory/`
- dotfiles候補:
  - 会社用GitHubアカウントのprivate dotfiles repository

## 会社用に作るもの

- `~/dotfiles/ai-memory/`
- 会社用dotfiles repository
- `~/.claude/CLAUDE.md`
- 必要ならGemini CLI / Antigravity CLI用の入口指示

## 会社用 `ai-memory` の方針

- 個人PCの `~/dotfiles/ai-memory/` は読まない。
- 会社PCの `~/dotfiles/ai-memory/` だけを読む。
- 会話ログ全文は保存しない。
- 長期的に使うルール、判断、確認手順だけを要約して残す。
- ユーザーが「ai-memoryに追記して」と言った場合だけ追記する。

## 会社用dotfilesの方針

- org管理外でも、会社用アカウントでprivate repositoryとして管理する。
- 個人dotfilesをそのままコピーしない。
- 会社PCで必要な最小設定から始める。
- Claude Codeの入口指示では `~/dotfiles/ai-memory/` を正本にする。
- 認証情報、token、secret、会社固有の機密設定はGit管理しない。

## Obsidianの位置づけ

- `ai-memory` はMarkdownフォルダであり、Obsidianは必須ではない。
- 日報、会議メモ、プロジェクト管理、判断ログまで自分で書くなら、Obsidian Vaultとして開く価値がある。
- AIに読ませるルール置き場だけなら、Claude Code / VS Code / terminalで十分。
