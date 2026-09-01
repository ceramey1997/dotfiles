# General zsh aliases for macOS

# Enhanced directory listing (using eza if available, fallback to ls)
if command -v eza &> /dev/null; then
    alias ls='eza'
    alias ll='eza -alh --git'
    alias la='eza -a'
    alias lt='eza --tree --level=2'
else
    alias ll='ls -alFh'
    alias la='ls -A'
fi

# Better cat with syntax highlighting (using bat if available)
if command -v bat &> /dev/null; then
    alias cat='bat --paging=never'
    alias less='bat'
fi

# Convenience aliases
alias reload='source ~/.zshrc'
alias zshconfig='$EDITOR ~/.zshrc'
alias dotfiles='cd ~/.dotfiles'
alias help='cat ~/Help.md'

# macOS specific
alias showfiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidefiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
