#!/bin/bash
set -e

export CODE=0
if [ ! -d "$XDG_DATA_HOME/asdf" ]; then
    LATESTTAG=$(curl --silent "https://api.github.com/repos/asdf-vm/asdf/releases/latest" | jq -r .tag_name)
    git clone https://github.com/asdf-vm/asdf.git $XDG_DATA_HOME/asdf --branch $LATESTTAG
    CODE=33
fi

if [ -f "$HOME/.tool-versions" ]; then
    echo -e "Will not create a .tool-versions file. One already exists"
else
    cp $HOME/.dotfiles/machine_setup/setup/.tool-version-cache $HOME/.tool-versions
    CODE=33
fi

echo "- list all plugins by executing: asdf plugin list all"
echo "- Install a plugin by executing: asdf plugin add <name>"
echo "- find versions by executing: asdf list all <installed-plguin-name>"
echo "- Install specific version via asdf install <name> <version>"

exit $CODE
