#!/bin/bash

# Install Zoxide (smarter cd alternative) for macOS

if [ -f "$HOME/.local/bin/zoxide" ]; then
    echo "Zoxide already installed. Exiting"
    CODE=0
    exit $CODE
fi

CODE=33

# Install zoxide using official installer
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

echo "Zoxide installed successfully to $HOME/.local/bin/zoxide"

exit $CODE
