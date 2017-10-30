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
