## Requirements
* neocomplete requires Vim 7.3.885+ compiled with if_lua

## Setup 
* [vim-plug](https://github.com/junegunn/vim-plug)をインストールする
* `setup.sh` を実行する
```sh
$ git clone --recursive git@github.com:hypermkt/dotfiles.git
$ cd dotfiles
$ /bin/sh ./setup.sh
```
* vimで`PlugInstall`を実行する

### git config
```sh
git config --global core.editor "vim"
```

### PHP
* Install [CHH/phpenv](https://github.com/CHH/phpenv)
* `git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build`
* `phpenv install 7.1.9`
