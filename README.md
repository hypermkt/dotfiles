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

#### Install with brew tap

```
brew tap caskroom/cask
brew tap caskroom/versions

brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install mi
brew cask install skitch
brew cask install docker
brew cask install gitify
brew cask install phpstorm
brew cask install licecap
brew cask install sequel-pro
brew cask install visual-studio-code
brew cask install spectacle
```

#### Install with mas
* https://github.com/mas-cli/mas

```
brew install mas

mas install 409183694 # Keynote (6.6.2)
mas install 803453959 # Slack (2.8.2)
mas install 458034879 # Dash (2.2.6)
mas install 539883307 # LINE (5.3.3)
```
