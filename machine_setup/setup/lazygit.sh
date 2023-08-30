#!/bin/bash
set -e

source $HOME/.bashrc
if [ -x "$(command -v lazygit)" ]; then
    echo "LazyGit already installed"
    exit 0
fi

if [ -d /home/linuxbrew ]; then
    /home/linuxbrew/.linuxbrew/bin/brew install jesseduffield/lazygit/lazygit
    exit 33
else
    echo "Brew must be installed before installing LazyGit"
    exit 1
fi
