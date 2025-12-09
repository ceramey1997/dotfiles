#!/bin/bash

# Platform detection library for cross-platform dotfiles
# Provides OS detection and platform-specific path resolution

# Detect operating system
# Returns: "linux" for Linux, "macos" for macOS, "unknown" for unsupported
detect_os() {
    case "$(uname -s)" in
        Linux*)     echo "linux";;
        Darwin*)    echo "macos";;
        *)          echo "unknown";;
    esac
}

# Get Homebrew prefix based on OS and architecture
# Returns: Platform-specific Homebrew installation path
get_brew_prefix() {
    local os=$(detect_os)
    if [[ "$os" == "macos" ]]; then
        # macOS: Check architecture
        if [[ $(uname -m) == "arm64" ]]; then
            echo "/opt/homebrew"  # Apple Silicon
        else
            echo "/usr/local"     # Intel Mac
        fi
    elif [[ "$os" == "linux" ]]; then
        echo "/home/linuxbrew/.linuxbrew"  # Linux Homebrew
    fi
}

# Check if running on macOS
# Returns: 0 if macOS, 1 otherwise
is_macos() {
    [[ "$(detect_os)" == "macos" ]]
}

# Check if running on Linux
# Returns: 0 if Linux, 1 otherwise
is_linux() {
    [[ "$(detect_os)" == "linux" ]]
}
