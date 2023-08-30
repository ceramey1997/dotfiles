#!/bin/bash

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
    source $HOME/.bashrc
    exit 33
fi
