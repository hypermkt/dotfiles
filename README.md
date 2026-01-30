# dotfiles

## Requirements
* neocomplete requires Vim 7.3.885+ compiled with if_lua

## Setup 

### .bashrc
```
$ ln -s ~/dotfiles/.bashrc ~/.bashrc
```

### .vimrc

```
$ ln -s ~/dotfiles/.vimrc ~/.vimrc
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

### PHP
* Install [CHH/phpenv](https://github.com/CHH/phpenv)

```
git clone https://github.com/CHH/php-build.git ~/.phpenv/plugins/php-build
phpenv install 7.1.9
```

### Ruby


### Tools
* Requirements
    * [Homebrew](https://brew.sh/index_ja)

```
/bin/sh ./install.sh install dev_tools
/bin/sh ./install.sh upgrade dev_tools
```

### Software

```
brew bundle
```
