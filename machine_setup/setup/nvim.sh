#!/bin/bash

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

if [ -x "$(command -v nvim)" ]; then
    echo "NeoVim already installed. Exiting"
    exit 0
fi

BREW_PREFIX=$(get_brew_prefix)

if ! [ -d "$BREW_PREFIX" ]; then
    echo "Brew must be installed before installing Neovim"
    exit 1
else
    echo "Installing nvim via Homebrew at $BREW_PREFIX"
    "$BREW_PREFIX/bin/brew" install neovim
    exit 33
fi
