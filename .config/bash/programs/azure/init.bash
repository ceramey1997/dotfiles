if [ -f "$XDG_CONFIG_HOME/bash/programs/azure/env.bash" ]; then
    . "$XDG_CONFIG_HOME/bash/programs/azure/env.bash"
fi

if [ -f "$XDG_CONFIG_HOME/bash/programs/azure/startup.bash" ]; then
    . "$XDG_CONFIG_HOME/bash/programs/azure/startup.bash"
fi
