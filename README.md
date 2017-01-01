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
* Caskroomの場所が変わったので[これ](http://rcmdnk.com/blog/2016/06/28/comptuer-mac-homebrew-brew-file/)を参考に移動をした
```sh
brew bundle
```

## Vim
* [vim-plug](https://github.com/junegunn/vim-plug)を利用してVim pluginを管理

```sh
# Pluginをインストールする
:PlugInstall
```

## git config
```sh
git config --global core.editor "vim"
```
