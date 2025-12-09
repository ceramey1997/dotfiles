#!/bin/bash
set -e

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

# Detect operating system
OS=$(detect_os)

echo "Detected OS: $OS"

case "$OS" in
    linux)
        echo "Running Linux setup..."
        sudo apt-get install jq -y
        source ~/.config/bash/xdg/env.bash
        bash ~/.dotfiles/installs/install.sh
        ;;
    macos)
        echo "Running macOS setup..."
        # Check for Xcode Command Line Tools
        if ! xcode-select -p &>/dev/null; then
            echo "Xcode Command Line Tools not found. Installing..."
            xcode-select --install
            echo "Please run setup.sh again after Xcode Command Line Tools installation completes."
            exit 0
        fi
        # Run macOS setup
        bash ~/.dotfiles/machine_setup/macos/main.sh
        ;;
    *)
        echo "Unsupported operating system: $OS"
        echo "This dotfiles repository supports Linux and macOS only."
        exit 1
        ;;
esac

