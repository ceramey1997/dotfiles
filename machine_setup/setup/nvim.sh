#!/bin/bash

source $HOME/.bashrc
if [ -x "$(command -v nvim)" ]; then
    echo "NeoVim already installed. Exiting"
    exit 0
fi

if ! [ -x "$(command -v brew)" ]; then
    echo "Brew must be installed before installing LazyGit"
    exit 1
else
    echo "Installing nvim"
    brew install neovim
    exit 33
fi
