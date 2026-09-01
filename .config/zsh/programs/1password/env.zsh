# 1Password SSH Agent configuration for macOS

# Set SSH_AUTH_SOCK to use 1Password's SSH agent
# macOS 1Password stores its SSH agent socket in the Group Containers directory
export SSH_AUTH_SOCK="$HOME/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"
