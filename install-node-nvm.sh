#!/usr/bin/env bash

# Exit on any error
set -e

# Install NVM if it doesn't exist
if [ ! -d "$HOME/.nvm" ]; then
  echo "Installing NVM..."
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js LTS
nvm install --lts
nvm use --lts

# Build markdown-preview frontend
if [ -d "$HOME/.local/share/nvim/lazy/markdown-preview.nvim/app" ]; then
  echo "Building markdown-preview.nvim..."
  cd "$HOME/.local/share/nvim/lazy/markdown-preview.nvim/app"
  npm install
fi
