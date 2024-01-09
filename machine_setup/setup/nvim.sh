#!/bin/bash

if [ -x "$(command -v nvim)" ]; then
    echo "NeoVim already installed. Exiting"
    exit 0
fi

if ! [ -d /home/linuxbrew ]; then
    echo "Brew must be installed before installing LazyGit"
    exit 1
else
    echo "Installing nvim"
    /home/linuxbrew/.linuxbrew/bin/brew install neovim
    exit 33
fi
