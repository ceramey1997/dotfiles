# Mise (development environment manager) configuration for bash

# Initialize mise
if command -v mise &> /dev/null; then
    eval "$(mise activate bash)"
fi
