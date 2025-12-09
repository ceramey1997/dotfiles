#!/bin/bash
set -e

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

if [ -x "$(command -v lazygit)" ]; then
    echo "LazyGit already installed"
    exit 0
fi

BREW_PREFIX=$(get_brew_prefix)

if [ -d "$BREW_PREFIX" ]; then
    echo "Installing LazyGit via Homebrew at $BREW_PREFIX"
    "$BREW_PREFIX/bin/brew" install jesseduffield/lazygit/lazygit
    exit 33
else
    echo "Brew must be installed before installing LazyGit"
    exit 1
fi
