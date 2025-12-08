# C# / .NET SDK environment configuration

# .NET SDK paths (installed via Homebrew on macOS)
if command -v dotnet &> /dev/null; then
    # Add dotnet tools to PATH
    export PATH="$HOME/.dotnet/tools:$PATH"
fi

# Optional: XDG-compliant paths for .NET tools
# export OMNISHARPHOME="$XDG_CONFIG_HOME/omnisharp"
# export NUGET_PACKAGES="$XDG_CACHE_HOME/NuGetPackages"
