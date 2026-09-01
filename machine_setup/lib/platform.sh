#!/bin/bash

# Platform detection library for cross-platform dotfiles
# Provides OS detection and platform-specific path resolution

# Detect operating system
# Returns: "wsl" for WSL, "linux" for native Linux, "macos" for macOS, "unknown" for unsupported
detect_os() {
    case "$(uname -s)" in
        Linux*)
            if is_wsl; then
                echo "wsl"
            else
                echo "linux"
            fi
            ;;
        Darwin*)    echo "macos";;
        *)          echo "unknown";;
    esac
}

# Check if running in WSL (Windows Subsystem for Linux)
# Returns: 0 if WSL, 1 otherwise
is_wsl() {
    if [[ -f /proc/version ]] && grep -qi microsoft /proc/version; then
        return 0
    elif [[ -f /proc/sys/kernel/osrelease ]] && grep -qi wsl /proc/sys/kernel/osrelease; then
        return 0
    else
        return 1
    fi
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

# Check if running on native Linux (not WSL)
# Returns: 0 if native Linux, 1 otherwise
is_linux() {
    [[ "$(detect_os)" == "linux" ]]
}

# Check if running on Linux or WSL (any Linux-based system)
# Returns: 0 if Linux or WSL, 1 otherwise
is_wsl_or_linux() {
    local os=$(detect_os)
    [[ "$os" == "linux" || "$os" == "wsl" ]]
}
