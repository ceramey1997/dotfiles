# Homebrew environment configuration for macOS

# Detect Homebrew installation path based on architecture
if [[ -f "/opt/homebrew/bin/brew" ]]; then
    # Apple Silicon Mac
    export HOMEBREW_PREFIX="/opt/homebrew"
elif [[ -f "/usr/local/bin/brew" ]]; then
    # Intel Mac
    export HOMEBREW_PREFIX="/usr/local"
fi

# Add Homebrew to PATH if found
if [[ -n "$HOMEBREW_PREFIX" ]]; then
    export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$PATH"
    export MANPATH="$HOMEBREW_PREFIX/share/man${MANPATH+:$MANPATH}"
    export INFOPATH="$HOMEBREW_PREFIX/share/info:${INFOPATH:-}"
fi
