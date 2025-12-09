# Azure CLI startup configuration

# Enable Azure CLI auto-completion for bash
if command -v az &> /dev/null; then
    source /home/linuxbrew/.linuxbrew/etc/bash_completion.d/az 2>/dev/null || true
fi

# Azure Functions Core Tools - no special initialization needed
# azcopy - no special initialization needed
# Bicep - integrated with Azure CLI
