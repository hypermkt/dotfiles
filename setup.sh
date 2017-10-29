#!/bin/sh

# ref: https://qiita.com/AkkeyLab/items/68680a397d545a2dfaff

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

# ----------------------------
# Install GUI Apps by Homebrew-Cask
# ----------------------------
echo "\nInstalling GUI Apps by Homebrew-Cask..."

brew tap caskroom/cask

brew cask install firefox
brew cask install google-chrome
brew cask install iterm2
brew cask install mi
brew cask install mou
brew cask install openoffice
brew cask install vagrant
brew cask install virtualbox
brew cask install skitch

# ----------------------------
# Install App Store Apps by mas
# ----------------------------

#brew install mas
