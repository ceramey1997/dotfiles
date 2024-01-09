#!/bin/bash
set -e

export CODE=0
if [ -d /home/linuxbrew ]; then
    echo "Brew already installed. Exiting"
    CODE=0
    exit $CODE
fi
CODE=33
echo "Installing Homebrew"
echo ""
echo "   ** || Installing dependencies... 'build-esential, procps, curl, file, git' || ** "

command curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
echo "Complete... brew installed."

exit $CODE
