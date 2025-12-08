# macOS Setup

This directory contains macOS-specific setup scripts and configuration for the dotfiles repository.

## Overview

The macOS setup uses:
- **Homebrew** for package management (via Brewfile)
- **Zsh** as the shell (macOS default since Catalina)
- **Bash scripts** for orchestration (instead of Ansible)
- **Platform-agnostic installers** for tools like NVM, Poetry, Zoxide, and oh-my-posh

## Files

- `Brewfile` - Declarative package manifest for Homebrew
- `main.sh` - Main orchestrator script that coordinates all installations
- `helpers/` - Helper scripts for individual tool installations
  - `nvm-install.sh` - Install NVM (Node Version Manager)
  - `poetry-install.sh` - Install Poetry (Python package manager)
  - `zoxide-install.sh` - Install Zoxide (smarter cd)
  - `dotnet/install-multiple-sdks.sh` - Install additional .NET SDK versions

## Prerequisites

### Xcode Command Line Tools

macOS requires Xcode Command Line Tools before installing Homebrew:

```bash
xcode-select --install
```

The setup script will check for this and prompt if needed.

## Installation

From the dotfiles root directory:

```bash
# 1. Run Dotbot to create symlinks
./install

# 2. Run setup script (auto-detects macOS and runs main.sh)
./setup.sh

# 3. Run post-install script
./post_install.sh

# 4. Reload shell
source ~/.zshrc
```

## What Gets Installed

### System Packages (via Homebrew)

- **Core utilities**: bash, git, curl, wget, jq, unzip
- **Development tools**: bat, eza, ripgrep, tree, socat
- **Primary tools**: neovim, lazygit, tmux, mise
- **.NET SDK**: Latest version via Homebrew cask

### Additional Tools (via installers)

- **oh-my-posh**: Cross-platform prompt theme engine
- **mise**: Development environment manager (for Node, Python, Ruby, etc.)
- **Zoxide**: Smart directory jumper
- **Nerd Fonts**: CascadiaCode for terminal

## Homebrew Paths

macOS Homebrew installs to different locations based on architecture:

- **Apple Silicon (M1/M2/M3)**: `/opt/homebrew`
- **Intel**: `/usr/local`

The dotfiles automatically detect and use the correct path.

## Shell Configuration

macOS uses **Zsh** with configuration in:

- `.zshrc` - Main zsh config
- `.config/zsh/` - Modular zsh configurations

This is separate from the Linux bash configs (`.bashrc`, `.config/bash/`).

## .NET SDK Versions

The Brewfile installs the latest .NET SDK via Homebrew cask. To install additional specific versions:

1. Edit `helpers/dotnet/install-multiple-sdks.sh`
2. Add download URLs from [Microsoft .NET Downloads](https://dotnet.microsoft.com/download/dotnet)
3. Run the script

## Troubleshooting

### Homebrew not found

After installing Homebrew, you may need to add it to your PATH manually:

```bash
# Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# Intel
eval "$(/usr/local/bin/brew shellenv)"
```

### Permission errors

Some Homebrew operations may require sudo. The installer will prompt when needed.

### Oh-my-posh not displaying correctly

Ensure you've installed Nerd Fonts and configured your terminal to use CascadiaCode:

1. Terminal → Preferences → Profiles → Font
2. Select "CaskaydiaCove Nerd Font"

## Updating

To update all Homebrew packages:

```bash
brew update
brew upgrade
brew cleanup
```

To update specific tools:

```bash
# Update mise
mise self-update
mise upgrade

# Update oh-my-posh
bash ~/.dotfiles/machine_setup/setup/oh_my_posh.sh
```

## Using mise

mise is a development environment manager that replaces tools like nvm, rbenv, pyenv, etc.

### Install Node.js
```bash
mise use -g node@latest    # Install latest Node
mise use -g node@20        # Install specific version
```

### Install Python
```bash
mise use -g python@latest  # Install latest Python
mise use -g python@3.11    # Install specific version
```

### Other Languages
```bash
mise use -g ruby@latest
mise use -g go@latest
mise use -g java@latest
```

### List installed tools
```bash
mise list
```

### Update all tools
```bash
mise upgrade
```

Learn more at: https://mise.jdx.dev

## Differences from Linux Setup

| Aspect | Linux | macOS |
|--------|-------|-------|
| Shell | Bash | Zsh |
| Config | `.bashrc`, `.config/bash/` | `.zshrc`, `.config/zsh/` |
| Package Manager | apt + Ansible | Homebrew + Brewfile |
| Homebrew Path | `/home/linuxbrew/.linuxbrew` | `/opt/homebrew` or `/usr/local` |
| Font Cache | `fc-cache -fv` | Automatic |
| .NET SDK | Tar extraction (specific versions) | Homebrew cask |
