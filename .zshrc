# ~/.zshrc: executed by zsh for interactive shells

# History configuration
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
mkdir -p ~/.cache/zsh

# History options
setopt HIST_IGNORE_DUPS      # Don't record duplicate entries
setopt HIST_FIND_NO_DUPS     # Don't show duplicates in search
setopt HIST_REDUCE_BLANKS    # Remove superfluous blanks
setopt SHARE_HISTORY         # Share history between sessions
setopt APPEND_HISTORY        # Append to history file

# Directory navigation
setopt AUTO_CD               # cd by typing directory name if it's not a command
setopt AUTO_PUSHD            # Make cd push old directory to directory stack
setopt PUSHD_IGNORE_DUPS     # Don't push duplicates
setopt PUSHD_SILENT          # Don't print directory stack after pushd/popd

# Completion system
autoload -Uz compinit
compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Color support for ls
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd

# Basic aliases
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Source XDG environment first
if [ -f ~/.config/zsh/xdg/env.zsh ]; then
    source ~/.config/zsh/xdg/env.zsh
fi

# Source all program environment configs
for config in ~/.config/zsh/programs/*/env.zsh(N); do
    source "$config"
done

# Source all program startup configs
for config in ~/.config/zsh/programs/*/startup.zsh(N); do
    source "$config"
done

# Source aliases
if [ -f ~/.config/zsh/aliases.zsh ]; then
    source ~/.config/zsh/aliases.zsh
fi
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"
