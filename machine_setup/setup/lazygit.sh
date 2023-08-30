#!/bin/bash
set -e

if [ -x "$(command -v lazygit)" ]; then
    echo "LazyGit already installed"
    exit 0
fi

if [ -x "$(command -v brew)" ]; then
    brew install jesseduffield/lazygit/lazygit
    source $HOME/.bashrc
    exit 33
else
    echo "Brew must be installed before installing LazyGit"
    exit 1
fi
