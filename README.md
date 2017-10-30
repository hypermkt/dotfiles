## Requirements
* neocomplete requires Vim 7.3.885+ compiled with if_lua

## Setup 
```sh
$ git clone --recursive git@github.com:hypermkt/dotfiles.git
$ cd dotfiles
$ /bin/sh ./setup.sh
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
