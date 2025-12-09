#!/bin/bash
set -e

# Source platform detection library
source "$HOME/.dotfiles/machine_setup/lib/platform.sh"

# Determine font directory based on platform
if is_macos; then
    FONT_DIR="$HOME/Library/Fonts"
else
    FONT_DIR="$HOME/.local/share/fonts"
fi

# Check if CascadiaCode Nerd Font is already installed
if ls "$FONT_DIR"/Caskaydia*.ttf &>/dev/null || ls "$FONT_DIR"/CaskaydiaCove*.ttf &>/dev/null; then
    echo "CascadiaCode Nerd Font already installed in $FONT_DIR"
    exit 0
fi

echo "Installing CascadiaCode Nerd Font to $FONT_DIR"
mkdir -p "$FONT_DIR"

# Get latest release tag
LATESTTAG=$(curl --silent "https://api.github.com/repos/ryanoasis/nerd-fonts/releases/latest" | jq -r .tag_name)

# Download and install
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/$LATESTTAG/CascadiaCode.zip" -P "$HOME"
unzip -o "$HOME/CascadiaCode.zip" -d "$FONT_DIR"

# Platform-specific post-install
if is_macos; then
    # macOS doesn't need fc-cache - fonts are automatically detected
    echo "✓ Fonts installed to $FONT_DIR"
else
    # Update font cache on Linux
    fc-cache -fv
    echo "✓ Fonts installed to $FONT_DIR"
fi

# Clean up
rm -rf "$HOME/CascadiaCode.zip"

# Exit with code 33 to indicate "changed/installed"
exit 33
