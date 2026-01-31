# dotfiles

## Requirements

- neocomplete requires Vim 7.3.885+ compiled with if_lua

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
$ ln -s ~/dotfiles/.vimrc ~/.vimrc
```

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
