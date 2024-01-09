#!/bin/bash

# $1 => path to net-version full directory i.e., $HOME/tmp/net7

set -e

export CODE=0
if [ ! -d "$HOME/.local/share/dotnet/sdk" ]; then
    CODE=33
    mv "$1/*" "/$HOME/.local/share/dotnet/"
fi

exit $CODE
