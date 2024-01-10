#!/bin/bash

if [ -d $HOME/.config/nvm ]; then
    echo "NVM already installed. Exiting"
    CODE=0
    exit $CODE
fi
echo "hi doing it"
CODE=33

export NVM_DIR="$HOME/.config/nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

exit $CODE
