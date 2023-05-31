export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export SOURCE="$XDG_CACHE_HOME"/NuGetPackages
# Nuget Credential Provider required specific manual installation https://github.com/microsoft/artifacts-credprovider#manual-installation-on-linux-and-mac
export NUGET_PLUGIN_PATHS="$XDG_CACHE_HOME"/NuGetPackages/plugins/netcore/CredentialProvider.Microsoft/CredentialProvider.Microsoft.dll
