#!/bin/bash
set -e

# macOS Setup Orchestrator Script
# Coordinates installation of all development tools and utilities

DOTFILES_DIR="$HOME/.dotfiles"
source "$DOTFILES_DIR/machine_setup/lib/platform.sh"

echo "=================================="
echo "Starting macOS Setup"
echo "=================================="

# 1. Install Homebrew if not present
if ! command -v brew &>/dev/null; then
    echo ""
    echo "[1/8] Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    # Add Homebrew to PATH for this script
    BREW_PREFIX=$(get_brew_prefix)
    eval "$("$BREW_PREFIX/bin/brew" shellenv)"
    echo "✓ Homebrew installed successfully"
else
    echo ""
    echo "[1/8] Homebrew already installed"
fi

# 2. Install packages from Brewfile
echo ""
echo "[2/8] Installing packages from Brewfile..."
brew bundle --file="$DOTFILES_DIR/machine_setup/macos/Brewfile"
echo "✓ Packages installed successfully"

# 3. Install oh-my-posh (cross-platform prompt theme engine)
echo ""
echo "[3/8] Installing oh-my-posh..."
bash "$DOTFILES_DIR/machine_setup/setup/oh_my_posh.sh" || { rc=$?; [ $rc -eq 33 ] && echo "✓ oh-my-posh installation complete" || exit $rc; }

# 4. Install Zoxide (smarter cd command)
echo ""
echo "[4/8] Installing Zoxide..."
bash "$DOTFILES_DIR/machine_setup/macos/helpers/zoxide-install.sh" || { rc=$?; [ $rc -eq 33 ] && echo "✓ Zoxide installation complete" || exit $rc; }

# 5. Install Nerd Fonts
echo ""
echo "[5/8] Installing Nerd Fonts..."
bash "$DOTFILES_DIR/machine_setup/setup/fonts.sh" || { rc=$?; [ $rc -eq 33 ] && echo "✓ Fonts installation complete" || exit $rc; }

# 6. Install Bicep via Azure CLI
echo ""
echo "[6/8] Installing Bicep..."
if command -v az &>/dev/null; then
    if ! az bicep version &>/dev/null; then
        az bicep install
        echo "✓ Bicep installed successfully"
    else
        echo "✓ Bicep already installed"
    fi
else
    echo "⚠️  Azure CLI not installed yet. Run 'az bicep install' after reloading shell."
fi

# 7. Optional: Install additional .NET SDKs if needed
echo ""
echo "[7/8] Checking .NET SDK installation..."
if command -v dotnet &>/dev/null; then
    echo "✓ .NET SDK installed:"
    dotnet --list-sdks
    echo ""
    echo "Note: To install additional .NET SDK versions, run:"
    echo "  bash $DOTFILES_DIR/machine_setup/macos/helpers/dotnet/install-multiple-sdks.sh"
else
    echo "⚠ .NET SDK not found. Run 'brew install --cask dotnet-sdk' to install."
fi

echo ""
echo "=================================="
echo "macOS setup complete!"
echo "=================================="
echo ""
echo "Next steps:"
echo "1. Run 'source ~/.zshrc' to reload your shell configuration"
echo "2. Install Node.js: mise use -g node@latest"
echo "3. Install Python: mise use -g python@latest"
echo ""
echo "Azure tools installed:"
echo "  - Azure CLI (az)"
echo "  - Azure Functions Core Tools (func)"
echo "  - azcopy"
echo "  - PowerShell (pwsh)"
echo "  - Bicep (az bicep)"
echo ""
echo "Learn more about mise: https://mise.jdx.dev"
echo ""
