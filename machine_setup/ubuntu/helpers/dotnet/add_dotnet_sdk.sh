#!/bin/bash
# $1 => netversion i.e., 7.0.404
# $2 => netversion RUNTIME i.e., 7.0.14
# $3 => path to net-version full directory i.e., $HOME/tmp/net7

set -e

export CODE=0
if [ ! -d "$HOME/.local/share/dotnet/sdk/$1" ]; then
    CODE=33
    mv "$3/sdk/$1" "$HOME/.local/share/dotnet/sdk"
fi

if [ ! -d "$HOME/.local/share/dotnet/shared/Microsoft.AspNetCore.App/$2" ]; then
    CODE=33
    mv "$3/shared/Microsoft.AspNetCore.App/$2" "$HOME/.local/share/dotnet/shared/Microsoft.AspNetCore.App"
fi

if [ ! -d "$HOME/.local/share/dotnet/shared/Microsoft.NETCore.App/$1" ]; then
    CODE=33
    mv "$3/shared/Microsoft.NETCore.App/$2" "$HOME/.local/share/dotnet/shared/Microsoft.NETCore.App"
fi

exit $CODE
