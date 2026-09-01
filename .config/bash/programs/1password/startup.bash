# Source platform-specific 1Password SSH agent configuration
# WSL uses a bridge to Windows 1Password, native Linux uses 1Password for Linux
# Skip on headless servers (no GUI = no 1Password app)

# Check if headless environment
if [[ -z "$DISPLAY" ]] && [[ -z "$WAYLAND_DISPLAY" ]]; then
    # Skip 1Password SSH agent on headless servers
    # Users should use traditional SSH keys instead
    return 0
fi

if [[ -f /proc/version ]] && grep -qi microsoft /proc/version; then
    # Running in WSL - use bridge to Windows 1Password
    source $XDG_CONFIG_HOME/1password/.agent-bridge.sh
elif [[ -f /proc/sys/kernel/osrelease ]] && grep -qi wsl /proc/sys/kernel/osrelease; then
    # Running in WSL (alternative detection) - use bridge to Windows 1Password
    source $XDG_CONFIG_HOME/1password/.agent-bridge.sh
else
    # Running on native Linux - use 1Password for Linux
    source $XDG_CONFIG_HOME/bash/programs/1password/.agent-linux.sh
fi

