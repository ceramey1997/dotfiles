# Initialize Homebrew shell environment

if [[ -n "$HOMEBREW_PREFIX" ]] && [[ -f "$HOMEBREW_PREFIX/bin/brew" ]]; then
    eval "$("$HOMEBREW_PREFIX/bin/brew" shellenv)"
fi
