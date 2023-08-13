#!/bin/bash
set -e

if [ -x "$(command -v brew)" ]; then
    echo "Brew already installed. Exiting"
    exit 0
fi
echo "Installing Homebrew"
echo ""
echo "   ** || Installing dependencies... 'build-esential, procps, curl, file, git' || ** "

command sudo apt-get update > /dev/null
command sudo apt-get install -y build-essential procps curl file git > /dev/null
command curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash

echo "Complete... brew installed."
