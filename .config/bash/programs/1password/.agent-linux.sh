# 1Password SSH Agent configuration for native Linux
# Uses 1Password for Linux's native SSH agent
# Only works on desktop Linux (requires 1Password GUI app)

# Set SSH_AUTH_SOCK to use 1Password's SSH agent
export SSH_AUTH_SOCK=$HOME/.1password/agent.sock

# Verify that 1Password SSH agent socket exists (suppress on headless)
if [[ ! -S "$SSH_AUTH_SOCK" ]] && [[ -n "$DISPLAY" || -n "$WAYLAND_DISPLAY" ]]; then
    echo "⚠️  1Password SSH agent socket not found at $SSH_AUTH_SOCK"
    echo "   Make sure 1Password for Linux is running and SSH agent is enabled"
    echo "   Settings → Developer → 'Use the SSH agent'"
fi
