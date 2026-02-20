# dotfiles

macOS + Ghostty + Neovim を中心とした開発環境。

## Requirements

- **Font**: [Nerd Fonts](https://www.nerdfonts.com/) (必須: アイコン表示のため)
  - 推奨: `JetBrainsMono Nerd Font`
- **Terminal**: [Ghostty](https://ghostty.org/) (推奨)

## Setup

1. Homebrewのインストールとパッケージ一括導入
```sh
brew bundle --file brew/Brewfile.common
```

2. シンボリックリンクの作成
```sh
# ローカルディレクトリの場所はよしなに修正
ln -s ~/ghq/github.com/hypermkt/dotfiles ~/dotfiles
```

### zsh

```sh
ln -s ./dotfiles/.zshrc ~/.zshrc
```

### nvim

```sh
ln -s ~/dotfiles/nvim ~/.config/nvim
```

初回起動後、LSPサーバーを自動インストール（mason.nvim）。使用言語サーバー：

| 言語 | サーバー |
| :--- | :--- |
| Ruby | [ruby-lsp](https://github.com/Shopify/ruby-lsp) |
| Lua | lua_ls |

ruby-lsp をグローバルで使う場合は事前にインストール：

```sh
gem install ruby-lsp
```

### Ghostty

```sh
# macOS固有の設定を削除
rm -rf ~/Library/Application\ Support/com.mitchellh.ghostty/

# シンボリックリンクを作成
mkdir -p ~/.config/ghostty && ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

### Claude Code

```sh
# シンボリックリンクを作成
ln -s ~/dotfiles/claude/settings.json ~/.claude/settings.json
ln -s ~/dotfiles/claude/CLAUDE.md ~/.claude/CLAUDE.md
ln -s ~/dotfiles/claude/hooks ~/.claude/hooks
```

設定内容:

| 設定 | 内容 |
| :--- | :--- |
| `settings.json` | プラグイン設定・フック |
| `CLAUDE.md` | グローバルAIルール（全プロジェクト共通） |
| `hooks/` | PreToolUse フックスクリプト |

**フック:**

| フック | 説明 |
| :--- | :--- |
| Stop | タスク完了時にmacOS通知（サウンド付き） |
| PreToolUse (Bash) | `rm -rf` / `git push --force` / `git reset --hard` などの破壊的コマンドを検出してブロック |

### git config

```sh
git config --global user.name "xxx"
git config --global user.email xxx

git config --global alias.s status
git config --global alias.ci commit
git config --global alias.b branch

git config --global core.editor "vim"
```

### Software

```sh
brew bundle
```

## キーマップ

### Neovim

リーダーキーは `,` (カンマ) に設定されています。

#### 共通操作

| Key | Description |
| :--- | :--- |
| `,e` | nvim-tree (サイドバー) を開く |
| `,ff` | ファイル検索 (Telescope) |
| `,fg` | 文字列検索 (Telescope / 要ripgrep) |
| `,fb` | バッファ検索 (Telescope) |
| `,fh` | ヘルプ検索 (Telescope) |
| `Ctrl+p` | ファイル検索 (Telescope / find_files) |
| `Ctrl+f` | 文字列検索 (Telescope / live_grep) |
| `Ctrl+b` | サイドバー開閉 |

#### ウィンドウ・タブ操作

| Key | Description |
| :--- | :--- |
| `ss` | 画面を上下に分割 |
| `sv` | 画面を左右に分割 |
| `sq` | 現在のウィンドウを閉じる |
| `Ctrl+w o` | 現在のウィンドウ以外を全部閉じる |
| `sh` | 左ウィンドウへ移動 |
| `sj` | 下ウィンドウへ移動 |
| `sk` | 上ウィンドウへ移動 |
| `sl` | 右ウィンドウへ移動 |
| `Ctrl+h` | 左ウィンドウへ移動 |
| `Ctrl+j` | 下ウィンドウへ移動 |
| `Ctrl+k` | 上ウィンドウへ移動 |
| `Ctrl+l` | 右ウィンドウへ移動 |
| `H` | 左のタブ(バッファ)へ移動 |
| `L` | 右のタブ(バッファ)へ移動 |
| `X` | 現在のタブ(バッファ)を閉じる |

#### 編集操作

| Key | Description |
| :--- | :--- |
| `Ctrl+/` | コメントアウト切替 |
| `Option+j` | 選択行を下に移動 (Visual mode) |
| `Option+k` | 選択行を上に移動 (Visual mode) |
| `Tab` | インデント (Visual mode) |
| `Shift+Tab` | インデント解除 (Visual mode) |
| `Ctrl+c` | クリップボードにコピー (Visual mode) |

#### LSP (Language Server Protocol)

| Key | Description |
| :--- | :--- |
| `gd` | 定義ジャンプ (Go to Definition) |
| `gD` | 宣言ジャンプ (Go to Declaration) |
| `gr` | 参照検索 (Go to References) |
| `gi` | 実装ジャンプ (Go to Implementation) |
| `K` | ドキュメント表示 (Hover) |
| `,rn` | リネーム (Rename) |
| `,ca` | コードアクション (Code Action) |
| `Ctrl+k` | シグネチャヘルプ (引数情報の表示) |

#### Claude Code (claudecode.nvim)

| Key | Description |
| :--- | :--- |
| `,cc` | Claude Code の表示/非表示を切り替え |
| `,cs` | 選択範囲を Claude Code に送信 (Visual mode) |

#### Git (Gitsigns / Telescope)

| Key | Description |
| :--- | :--- |
| `,gs` | 変更されたファイルの一覧を表示 (Telescope) |
| `]c` | 次の変更箇所へ移動 |
| `[c` | 前の変更箇所へ移動 |
| `,hp` | 変更箇所のプレビュー (Hunk Preview) |
| `,hr` | 変更のリセット (Hunk Reset) |
| `,hs` | 変更のステージング (Hunk Stage) |
| `,hb` | 行のコミット履歴を表示 (Blame Line) |

### LazyGit

`,gg` でlazygitを起動。

**ファイルステージング・コミット**

| Key | Description |
| :--- | :--- |
| `space` | ファイルのステージング/アンステージング |
| `a` | 全ファイルをステージング/アンステージング |
| `c` | コミットメッセージを入力してコミット |
| `A` | 直前のコミットに追加 (amend) |

**ブランチ操作**

| Key | Description |
| :--- | :--- |
| `2` | ブランチ一覧パネルへ移動 |
| `n` | 新しいブランチを作成 |
| `space` | ブランチをチェックアウト |
| `M` | 現在のブランチにマージ |
| `r` | 現在のブランチにrebase |
| `d` | ブランチを削除 |

**その他**

| Key | Description |
| :--- | :--- |
| `p` | リモートからpull |
| `P` | リモートへpush |
| `s` | stashに保存 |
| `?` | キーバインド一覧を表示 |
| `q` | lazygitを終了 |
