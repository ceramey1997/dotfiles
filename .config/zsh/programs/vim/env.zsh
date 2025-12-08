# Vim / Neovim environment configuration

# Set default editor to neovim if available, otherwise vim
if command -v nvim &> /dev/null; then
    export EDITOR='nvim'
    export VISUAL='nvim'
    alias vim='nvim'
    alias vi='nvim'
elif command -v vim &> /dev/null; then
    export EDITOR='vim'
    export VISUAL='vim'
fi

# Neovim XDG configuration
export VIMINIT='source $MYVIMRC'
export MYVIMRC="$XDG_CONFIG_HOME/nvim/init.lua"
