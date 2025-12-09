# Git aliases and configuration for zsh

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --decorate'
alias gd='git diff'
alias gco='git checkout'
alias gb='git branch'

# LazyGit alias if available
if command -v lazygit &> /dev/null; then
    alias lg='lazygit'
fi
