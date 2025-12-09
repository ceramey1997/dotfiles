#!/bin/bash
set -e

# Install additional .NET SDK versions on macOS
# The primary SDK is installed via Homebrew cask in Brewfile
# This script allows installing specific versions from Microsoft

echo "Checking .NET SDK installation..."

# Check if dotnet is available
if ! command -v dotnet &>/dev/null; then
    echo "ERROR: .NET SDK not found!"
    echo "Please install the base .NET SDK first:"
    echo "  brew install --cask dotnet-sdk"
    exit 1
fi

echo ""
echo "Currently installed .NET SDKs:"
dotnet --list-sdks
echo ""

# Function to install additional SDK version
# Usage: install_dotnet_version "version" "download_url"
install_dotnet_version() {
    local version=$1
    local download_url=$2

    if dotnet --list-sdks | grep -q "$version"; then
        echo ".NET SDK $version already installed"
        return 0
    fi

    echo "Installing .NET SDK $version..."

    # Download and install
    local temp_file="/tmp/dotnet-sdk-$version.pkg"
    echo "Downloading from: $download_url"
    curl -L "$download_url" -o "$temp_file"

    echo "Installing package..."
    sudo installer -pkg "$temp_file" -target /

    # Clean up
    rm "$temp_file"

    echo "✓ .NET SDK $version installed successfully"
}

# Example: Install specific versions
# Uncomment and modify URLs as needed from: https://dotnet.microsoft.com/download/dotnet

# .NET 6.0.417 (if needed)
# install_dotnet_version "6.0.417" "https://download.visualstudio.microsoft.com/download/pr/.../dotnet-sdk-6.0.417-osx-x64.pkg"

# .NET 7.0.404 (if needed)
# install_dotnet_version "7.0.404" "https://download.visualstudio.microsoft.com/download/pr/.../dotnet-sdk-7.0.404-osx-x64.pkg"

echo ""
echo "All .NET SDKs installed:"
dotnet --list-sdks
echo ""
echo "To install additional versions, edit this script and add download URLs from:"
echo "https://dotnet.microsoft.com/download/dotnet"
