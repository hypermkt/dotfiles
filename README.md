## Requirements
* neocomplete requires Vim 7.3.885+ compiled with if_lua

## Setup 
```sh
git clone --recursive git@github.com:hypermkt/dotfiles.git
brew tap Homebrew/bundle
```

## Install 
* [Homebrew Bundle](https://github.com/Homebrew/homebrew-bundle)を利用して各種必要ソフトウェアを一括インストールする
* caskroom/caskでインストールされるのでbrew-caskがあると誤動作する
* brew-caskはbrew uninstall brew-caskかrm -rf /usr/local/Cellar/brew-caskで削除する
```sh
brew bundle
```

## git config
```sh
git config --global core.editor "vim"
```
