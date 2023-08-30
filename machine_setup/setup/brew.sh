#!/bin/bash
set -e

export CODE=0
if [ -x "$(command -v brew)" ]; then
    echo "Brew already installed. Exiting"
    source $HOME/.bashrc
    CODE=0
    exit $CODE
fi
CODE=33
echo "Installing Homebrew"
echo ""
echo "   ** || Installing dependencies... 'build-esential, procps, curl, file, git' || ** "

command sudo apt-get update > /dev/null
command sudo apt-get install -y build-essential procps curl file git > /dev/null
command curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

echo "Complete... brew installed."
source $HOME/.bashrc

exit $CODE
