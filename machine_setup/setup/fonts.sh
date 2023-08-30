#!/bin/bash
set -e

LATESTTAG=$(curl --silent "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | jq -r .tag_name)
wget https://github.com/ryanoasis/nerd-fonts/releases/download/$LATESTTAG/CascadiaCode.zip -P $HOME
unzip $HOME/CascadiaCode.zip $HOME/.local/share/fonts
fc-cache -fv

rm -rf $HOME/CascadiaCode.zip


#https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/CascadiaCode.zip
