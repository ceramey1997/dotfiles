#!/bin/bash
set -e

if [ -f "tools/asdf.sh" ]; then
    bash tools/asdf.sh
fi

if [ -f "tools/brew.sh" ]; then
    bash tools/brew.sh
fi

if [ -f "tools/lazygit.sh" ]; then
    bash tools/lazygit.sh
fi

if [ -f "tools/nvim.sh" ]; then
    bash tools/nvim.sh
fi

if [ -f "tools/oh_my_posh.sh" ]; then
    bash tools/oh_my_posh.sh
fi
