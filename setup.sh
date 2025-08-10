#!/usr/bin/env bash
set -euo pipefail

# Ensure Homebrew shell env
eval "$(/opt/homebrew/bin/brew shellenv)"

# Restore Brew packages if Brewfile exists
[ -f "$HOME/dotfiles/Brewfile" ] && brew bundle --file="$HOME/dotfiles/Brewfile"

# Symlinks
ln -sf "$HOME/dotfiles/.zshrc" "$HOME/.zshrc"
ln -sf "$HOME/dotfiles/.zprofile" "$HOME/.zprofile"
ln -sf "$HOME/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$HOME/dotfiles/.gitignore_global" "$HOME/.gitignore_global"
[ -f "$HOME/dotfiles/.p10k.zsh" ] && ln -sf "$HOME/dotfiles/.p10k.zsh" "$HOME/.p10k.zsh"

echo "Dotfiles bootstrap complete ✅"
