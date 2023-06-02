
if command -v brew > /dev/null; then
    if [ -f "$XDG_CONFIG_HOME/bash/programs/brew/env.bash" ]; then
        . "$XDG_CONFIG_HOME/bash/programs/brew/env.bash"
    fi
    
    if [ -f "$XDG_CONFIG_HOME/bash/programs/brew/startup.bash" ]; then
        . "$XDG_CONFIG_HOME/bash/programs/brew/startup.bash"
    fi
fi
