#!/bin/bash

set -uo pipefail

BREW_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "🍺 Installing common packages from Brewfile.common..."
brew bundle --file="$BREW_DIR/Brewfile.common"

if [ "$1" = "home" ]; then
    if [ -f "$BREW_DIR/Brewfile.home" ]; then
        echo "🏠 Installing home packages from Brewfile.home..."
        brew bundle --file="$BREW_DIR/Brewfile.home"
    else
        echo "⚠️  Brewfile.home not found."
    fi
elif [ "$1" = "work" ]; then
    if [ -f "$BREW_DIR/Brewfile.work" ]; then
        echo "🏢 Installing work packages from Brewfile.work..."
        brew bundle --file="$BREW_DIR/Brewfile.work"
    else
        echo "⚠️  Brewfile.work not found."
    fi
else
    echo "⚠️  No environment specified or unknown environment: '$1'"
    echo "   Usage: ./install.sh [home|work]"
    echo "   Only common packages were installed."
fi

echo "✨ Done!"
