# 1Password SSH Agent startup for macOS

# Verify that 1Password SSH agent socket exists
if [[ ! -S "$SSH_AUTH_SOCK" ]]; then
    echo "⚠️  1Password SSH agent socket not found"
    echo "   Make sure 1Password is running and SSH agent is enabled"
    echo "   Settings → Developer → 'Use the SSH agent'"
fi
