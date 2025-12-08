#!/bin/bash
set -e

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

export CODE=0
BREW_PREFIX=$(get_brew_prefix)

if [ -d "$BREW_PREFIX" ]; then
    echo "Brew already installed at $BREW_PREFIX. Exiting"
    CODE=0
    exit $CODE
fi

CODE=33
echo "Installing Homebrew"
echo ""

if is_linux; then
    echo "   ** || Installing dependencies for Linux... 'build-essential, procps, curl, file, git' || ** "
fi

command curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
echo "Complete... brew installed at $BREW_PREFIX"

exit $CODE
