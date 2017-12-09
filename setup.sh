#!/bin/sh

# ref: https://qiita.com/AkkeyLab/items/68680a397d545a2dfaff

# ----------------------------
# dotfiles
# ----------------------------

if [ ! -f ~/.bashrc ]; then
  echo "Linking .bashrc"
  ln -s ~/dotfiles/.bashrc ~/.bashrc
fi

if [ ! -f ~/.vimrc ]; then
  echo "Linking .vimrc"
  ln -s ~/dotfiles/.vimrc ~/.vimrc
fi

if [ ! -d ~/.vim ]; then
  echo "Creating direcory .vim"
  ln -s ~/dotfiles/.vim ~/.vim
fi

# ----------------------------
# Install CUI Apps by Homebrew
# ----------------------------
if [ -e /usr/local/bin/brew ]; then
  echo "Homebrew is installed."
else
  echo "Homebrew is not installed. Installing homebrew now."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  echo "Installed Homebrew"

  brew update
fi

echo "\nInstalling CUI Apps by Homebrew..."
brew install tree
brew install tig
brew install wget
brew install git
brew install go
brew install peco
brew install bash-completion
brew install reattach-to-user-namespace
brew install gibo
brew install tmux
brew install ag
brew install phpbrew
brew install awscli
brew install postgresql
brew install packer
brew install terraform
brew install jq

# For PHP
brew install automake autoconf curl pcre bison re2c mhash libtool icu4c gettext jpeg openssl libxml2 mcrypt gmp libevent bzip2
brew link icu4c
brew link --force openssl
brew link --force libxml2

# For Ruby
brew install rbenv

# ----------------------------
# Install GUI Apps by Homebrew-Cask
# ----------------------------
echo "\nInstalling GUI Apps by Homebrew-Cask..."

brew tap caskroom/cask
brew tap caskroom/versions

#brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install mi
#brew cask install openoffice
brew cask install vagrant
brew cask install virtualbox
brew cask install skitch
brew cask install hipchat
brew cask install docker
brew cask install gitify
brew cask install phpstorm
brew cask install licecap
brew cask install inkdrop
brew cask install sequel-pro

# ----------------------------
# Install App Store Apps by mas
# ----------------------------
# ref: https://github.com/mas-cli/mas

brew install mas

#mas install 409183694 # Keynote (6.6.2)
mas install 803453959 # Slack (2.8.2)
mas install 458034879 # Dash (2.2.6)
mas install 539883307 # LINE (5.3.3)
# Alfred2のID不明
