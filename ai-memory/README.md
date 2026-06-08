# ai-memory

複数のAIツールに共通して読ませるための、個人用ナレッジフォルダです。
Claude Code / Codex / Gemini などで、作業前の前提共有に使います。

正本は `~/dotfiles/ai-memory/` です。

## 使い方

- AIに作業させる前に、必要なMarkdownを読ませる。
- 新しい判断、ルール、好み、運用方針が出たら追記する。
- プロジェクト固有情報は専用ファイルへ分ける。
- 機密情報、パスワード、APIキー、個人情報の詳細は書かない。

## AIツールとの連携

- Claude Code: `~/.claude/CLAUDE.md` からこのフォルダを参照する。
- Codex: `~/.codex/AGENTS.md` からこのフォルダを参照する。
- Gemini / ChatGPT Web: 必要なMarkdownを貼るか、ファイル参照できる環境で読ませる。
- Obsidian: `~/dotfiles/ai-memory/` をVaultとして開くと、人間用の編集UIとして使える。

## 追記ルール

- 自動更新ではなく、ユーザーが「ai-memoryに追記して」と依頼したときに追記する。
- Claude Codeのauto memoryはClaude Code専用の作業学習として扱う。
- 全AIに共通で使いたい内容だけ `~/dotfiles/ai-memory/` に残す。
- 雑談、一時メモ、未整理のログは入れない。
- 追記前に、保存先ファイルと追記内容の要点を確認する。

## 基本ルール

- 回答は「結論 → 理由 → 次のアクション」の順に短くする。
- 曖昧な一般論ではなく、具体的な手順、確認方法、次の操作を出す。
- 可能な検証はAI側で先に実施する。
- プロジェクトごとの判断は、該当プロジェクト用Markdownに追記する。

## ファイル構成

- `user.md`: 自分の回答スタイル、思考傾向、作業方針。
- `engineering.md`: 開発時の基本方針。
- `github.md`: GitHub / branch / PR / merge の運用ルール。
- `infra.md`: インフラ、外部サービス、障害確認の観点。
- `environments.md`: 個人PC、会社PC、会社用AIメモリ運用。
- `hp-project.md`: HPリニューアル案件用メモ。
- `travel.md`: 海外旅行メモ。
- `projects/`: プロジェクト固有ルール。
- `decisions/`: 重要な判断ログ。
- `prompts/`: AIに渡す再利用プロンプト。
- `templates/`: プロジェクトごとに増やすテンプレート。

## 更新方針

- 1回の追記は短くする。
- 日付、背景、決定理由を残す。
- 古くなった内容は消すより「更新済み」として残す。
- 判断に迷ったら、専用ファイルを増やして分離する。
