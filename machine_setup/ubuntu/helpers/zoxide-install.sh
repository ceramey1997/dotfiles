#!/bin/bash

if [ -f $HOME/.local/bin/zoxide ]; then
    echo "Zoxide already installed. Exiting"
    CODE=0
    exit $CODE
fi
CODE=33
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
exit $CODE
