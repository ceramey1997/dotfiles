#!/bin/bash
set -e

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

# Detect operating system
OS=$(detect_os)

echo "Detected OS: $OS"

# Ask for machine type if not already set (used for 1Password and other configs)
MACHINE_TYPE_FILE="$HOME/.config/.machine_type"
if [ ! -f "$MACHINE_TYPE_FILE" ]; then
    echo ""
    echo "Machine Type Setup"
    echo "  1) Personal (simple configurations)"
    echo "  2) Work (complex configurations with directory-based settings)"
    read -p "Is this a personal or work machine? (1/2): " machine_choice

    case $machine_choice in
        1)
            echo "personal" > "$MACHINE_TYPE_FILE"
            echo "✓ Machine type set to: personal"
            ;;
        2)
            echo "work" > "$MACHINE_TYPE_FILE"
            echo "✓ Machine type set to: work"
            ;;
        *)
            echo "Error: Invalid choice. Please select 1 or 2."
            exit 1
            ;;
    esac
    echo ""
fi

# Export machine type for use by setup scripts
export MACHINE_TYPE=$(cat "$MACHINE_TYPE_FILE")

case "$OS" in
    wsl)
        echo "Running WSL setup..."
        sudo apt-get update
        sudo apt-get install -y jq ansible
        source ~/.config/bash/xdg/env.bash
        ansible-playbook ~/.dotfiles/machine_setup/ubuntu/main.yml
        ;;
    linux)
        echo "Running native Linux setup..."
        sudo apt-get update
        sudo apt-get install -y jq ansible
        source ~/.config/bash/xdg/env.bash
        ansible-playbook ~/.dotfiles/machine_setup/ubuntu/main.yml
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

