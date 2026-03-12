#!/bin/bash

set -uo pipefail

BREW_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

upgrade_brewfile() {
  local brewfile="$1"
  local label="$2"

  echo "$label"

  local brews
  brews=$(brew bundle list --file="$brewfile" --brews 2>/dev/null || true)
  local casks
  casks=$(brew bundle list --file="$brewfile" --casks 2>/dev/null || true)

  [ -n "$brews" ] && brew upgrade $brews
  [ -n "$casks" ] && brew upgrade --cask $casks
}

echo "🍺 Upgrading common packages from Brewfile.common..."
upgrade_brewfile "$BREW_DIR/Brewfile.common" "📦 Upgrading common packages..."

if [ "${1:-}" = "home" ]; then
  if [ -f "$BREW_DIR/Brewfile.home" ]; then
    upgrade_brewfile "$BREW_DIR/Brewfile.home" "🏠 Upgrading home packages..."
  fi
elif [ "${1:-}" = "work" ]; then
  if [ -f "$BREW_DIR/Brewfile.work" ]; then
    upgrade_brewfile "$BREW_DIR/Brewfile.work" "🏢 Upgrading work packages..."
  fi
fi

echo "✨ Done!"
