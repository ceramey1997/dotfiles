# Mise (development environment manager) configuration for zsh

# Initialize mise
if command -v mise &> /dev/null; then
    eval "$(mise activate zsh)"
fi
