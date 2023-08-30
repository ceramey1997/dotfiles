#!/bin/bash

if [ -x "$(command -v nvim)" ]; then
    echo "oh-my-posh already installed. Exiting"
    exit 0
fi
if [ -d "$HOME/.local/bin" ]; then
    echo "Installing unzip..."
    command sudo apt-get update > /dev/null
    command sudo apt-get install -y > /dev/null
    command sudo apt-get install unzip > /dev/null
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d $HOME/.local/bin
    echo "******************************************************************************"
    echo "    1)"
    echo "        Install a NerdFont with 'sudo oh-my-posh font install'"
    echo ""
    echo "            https://ohmyposh.dev/docs/installation/fonts"
    echo ""
    echo "        Then Configure the font with windows terminal settings"
    echo "   --------------------------------------------------------------------"
    echo "    2)"
    echo "        Install a custom design... By Default will install easy-term"
    echo ""
    echo "    	 ----------****|| see below for insperation ||****-------------"
    echo "              https://ohmyposh.dev/docs/installation/fonts"
    echo "******************************************************************************"
fi
