# hypermkt's dotfiles (AI Rules)

## このファイルの目的
この AGENTS.md は、dotfiles リポジトリに対して AI（Claude Code / Gemini CLI）が
コード生成・修正・提案を行う際のルールを定義する。


## 主要な構成
- **Shell**: zsh
- **Editor**: Vim / Neovim
- **Terminal**: Ghostty
- **OS**: macOS

## AI 振る舞いルール
- 返答はすべて日本語で行う。
- 設定変更時は、理由と影響範囲を説明する。
- 破壊的変更を伴う場合は、必ず事前に確認を取る。
- macOS / zsh / Ghostty / Vim 環境を前提に提案する。
- 既存の設定方針を尊重し、過剰な自動化・複雑化は避ける。

## スクリプト方針
- シェルスクリプトは POSIX + zsh 互換を意識する。
- 可読性を優先し、ワンライナーの多用は避ける。
- 依存ツールの追加は最小限にする。

## Git コミットルール
- コミットメッセージは日本語で記述する。
- 以下の形式を推奨する：

  feat: Ghostty設定を追加
  fix: zshエイリアスのパスを修正
  chore: READMEを更新

## dotfiles 特有の注意点
- 個人の作業効率を最優先とする。
- 安定性と保守性を重視する。
- 新規ツール導入時は、既存構成との整合性を最優先とする。
- Neovimのキーマップを追加・変更した場合は、README.md のキーマップ表も合わせて更新する。
