if [ -f "$XDG_CONFIG_HOME/bash/programs/asdf/env.bash" ]; then
    . "$XDG_CONFIG_HOME/bash/programs/asdf/env.bash"
fi

if [ -f "$XDG_CONFIG_HOME/bash/programs/asdf/startup.bash" ]; then
    . "$XDG_CONFIG_HOME/bash/programs/asdf/startup.bash"
fi
