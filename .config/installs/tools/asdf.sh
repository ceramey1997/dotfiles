#!/bin/bash
set -e

if [ ! -d "$XDG_DATA_HOME/asdf" ]; then
    LATESTTAG=$(curl --silent "https://api.github.com/repos/asdf-vm/asdf/releases/latest" | jq -r .tag_name)
    git clone https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch $LATESTTAG
fi

if [ -f "$HOME/.tool-versions" ]; then
    echo -e "Will not create a .tool-versions file. One already exists"
else
    read -p "Would you like to copy cached .tool-versions file? (y/n): " USECACHE
    if [[ $USECACHE == "y" ]]; then
        cp ../.tool-version-cache $HOME/.tool-versions
    else
        read -p "Would you like to automatically add plugin's to your .tool-versions file? (y/n): " ADDPLUGINS
        if [[ $ADDPLUGINS == "y" ]]; then
            echo ""
            echo -e "Enter all asdf plugins and versions to add to .tool-version file. Enter done for plugin when complete.\n"
            echo -e "===========================Requested Plugins================================"
            CONTINUE=true
            COUNT=1
            while $CONTINUE; do
                read -p "$COUNT) Plugin Name: " PLUGIN
                if [[ "$PLUGIN" == "done" ]]; then
                    CONTINUE=true
                    break;
                fi
                read -p "    Enter desired version for $PLUGIN: " VERSION
                COUNT=$(($COUNT + 1))
                echo "$PLUGIN $VERSION" >> "$HOME/.tool-versions"
            done;
            echo $'============================================================================'
        else
            echo "- list all plugins by executing: asdf plugin list all"
            echo "- Install a plugin by executing: asdf plugin add <name>"
            echo "- find versions by executing: asdf list all <installed-plguin-name>"
            echo "- Install specific version via asdf install <name> <version>"
        fi
    fi
fi
