# dotfiles

## Setup

```
# ローカルディレクトリの場所はよしなに修正
ln -s ~/ghq/github.com/hypermkt/dotfiles ~/dotfiles
```

### zsh

```
ln -s ./dotfiles/.zshrc ~/.zshrc
```

### .vimrc

```
ln -s ~/dotfiles/.vimrc ~/.vimrc
```

### nvim
```
ln -s ~/dotfiles/nvim ~/.config/nvim
```

* `,e`: nvim-treeを開く
* `,ff`: ファイル検索 (Telescope)
* `,fg`: 文字列検索 (Telescope / 要ripgrep)
* `,fb`: バッファ検索 (Telescope)
* `,fh`: ヘルプ検索 (Telescope)

#### VS Code風キーバインディング
* `Ctrl+p`: ファイル検索
* `Ctrl+f`: 文字列検索
* `Ctrl+b`: サイドバー開閉
* `Ctrl+/`: コメントアウト切替
* `Ctrl+h/j/k/l`: ウィンドウ移動

### Ghostty

```
# macOS固有の設定を削除
rm -rf ~/Library/Application\ Support/com.mitchellh.ghostty/

# シンボリックリンクを作成
mkdir -p ~/.config/ghostty && ln -s ~/dotfiles/ghostty/config ~/.config/ghostty/config
```

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

```
brew bundle
```
