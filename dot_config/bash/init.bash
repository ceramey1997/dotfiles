# Include XDG Environment Setup
if [ -f "$HOME/.config/bash/xdg/init.bash" ]; then
    . "$HOME/.config/bash/xdg/init.bash"
fi

# Setup bash specific
if [ -f "$XDG_CONFIG_HOME/bash/env.bash" ]; then
    . "$HOME/.config/bash/env.bash"
fi

# Setup Random Bash Aliases
if [ -f "$XDG_CONFIG_HOME/bash/aliases.random.bash" ]; then
    . "$HOME/.config/bash/aliases.random.bash"
fi

# Setup Program specific
if [ -f "$XDG_CONFIG_HOME/bash/programs/init.bash" ]; then
    . "$XDG_CONFIG_HOME/bash/programs/init.bash"
fi

