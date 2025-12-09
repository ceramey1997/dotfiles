# Azure CLI startup configuration

# Enable Azure CLI auto-completion for zsh
if command -v az &> /dev/null; then
    autoload -U +X bashcompinit && bashcompinit
    source /opt/homebrew/etc/bash_completion.d/az 2>/dev/null || \
    source /usr/local/etc/bash_completion.d/az 2>/dev/null || true
fi

# Azure Functions Core Tools - no special initialization needed
# PowerShell - no special initialization needed
# azcopy - no special initialization needed
# Bicep - integrated with Azure CLI
