# Dotfiles

Cross-platform dotfiles for Linux (Ubuntu/WSL) and macOS. Manages development environment configuration using Dotbot for symlinking and platform-specific setup scripts.

## Supported Platforms

- **Linux**: Ubuntu/Debian (with bash)
- **macOS**: macOS 10.15+ (with zsh)

## Quick Start

### Prerequisites

#### Linux (Ubuntu/WSL)
```bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install git ansible -y
```

#### macOS
```bash
# Xcode Command Line Tools (required for Homebrew)
xcode-select --install
```

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/ceramey1997/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run installation**
   ```bash
   # Install dotfiles (creates symlinks)
   ./install

   # Setup platform-specific tools and packages
   ./setup.sh

   # Reload shell configuration
   source ~/.bashrc  # Linux
   source ~/.zshrc   # macOS
   ```

3. **Install development tools with mise (optional)**
   ```bash
   # Install Node.js
   mise use -g node@latest

   # Install Python
   mise use -g python@latest

   # Install other tools as needed
   # mise use -g ruby@latest
   # mise use -g go@latest
   ```

4. **Configure Git (optional but recommended)**
   ```bash
   # Set your git identity
   git config --global user.email "your.email@example.com"
   git config --global user.name "Your Name"

   # Optional: Set up commit signing with SSH
   git config --global gpg.format ssh
   git config --global commit.gpgsign true
   git config --global user.signingkey "<your public ssh key>"
   git config --global gpg.ssh.program "<path to op-ssh-sign or gpg>"
   ```

   > **Note**: For 1Password SSH signing on macOS, use:
   > ```bash
   > git config --global gpg.ssh.program "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
   > ```

## What Gets Installed

### Common Tools (Both Platforms)
- **Neovim**: Modern Vim-based text editor
- **Tmux**: Terminal multiplexer
- **mise**: Development environment manager (replaces nvm, asdf, etc.)
- **Zoxide**: Smarter `cd` command
- **Oh-my-posh**: Cross-platform shell prompt theme
- **LazyGit**: Git TUI
- **Bat**: Better `cat` with syntax highlighting
- **Eza**: Better `ls` with colors and git integration
- **Ripgrep**: Fast recursive search
- **.NET SDK**: Latest version
- **Nerd Fonts**: CascadiaCode for terminal

### Linux-Specific
- **Package Manager**: apt + Ansible
- **Shell**: Bash with modular configs in `.config/bash/`
- **Homebrew**: Linux Homebrew at `/home/linuxbrew/.linuxbrew`

### macOS-Specific
- **Package Manager**: Homebrew with Brewfile
- **Shell**: Zsh with modular configs in `.config/zsh/`
- **Homebrew**: Native macOS Homebrew
  - Apple Silicon: `/opt/homebrew`
  - Intel: `/usr/local`

## Configuration Structure

### Linux (Bash)
```
~/.bashrc                      # Main bash config
~/.config/bash/                # Modular bash configurations
├── xdg/env.bash              # XDG Base Directory variables
├── programs/                 # Program-specific configs
│   ├── brew/                 # Homebrew
│   ├── nvm/                  # Node Version Manager
│   ├── git/                  # Git aliases
│   └── ...
```

### macOS (Zsh)
```
~/.zshrc                       # Main zsh config
~/.config/zsh/                 # Modular zsh configurations
├── xdg/env.zsh               # XDG Base Directory variables
├── programs/                 # Program-specific configs
│   ├── brew/                 # Homebrew
│   ├── nvm/                  # Node Version Manager
│   ├── git/                  # Git aliases
│   └── ...
└── aliases.zsh               # General aliases
```

### Shared Configs (Both Platforms)
```
~/.config/nvim/                # Neovim configuration
~/.config/tmux/                # Tmux configuration
~/.config/oh-my-posh/          # Oh-my-posh themes
```

## Platform Detection

The dotfiles automatically detect your platform and apply the appropriate configurations:

- **Dotbot**: Uses `uname -s` to conditionally symlink bash (Linux) or zsh (macOS) configs
- **Setup scripts**: Use `machine_setup/lib/platform.sh` for OS detection and path resolution
- **Shell configs**: Completely separate - no conditional logic within config files

## 1Password CLI Setup

### Windows + WSL
1. Ensure 1Password desktop app is installed and configured
2. Follow the [official guide](https://developer.1password.com/docs/ssh/get-started) for Windows
3. Follow this [WSL setup readme](https://gist.github.com/WillianTomaz/a972f544cc201d3fbc8cd1f6aeccef51)

### macOS
1. Install 1Password desktop app
2. Enable SSH agent in 1Password settings
3. Configure git to use 1Password for signing:
   ```bash
   export GIT_GPG_SSH_PROGRAM="/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
   ```

## Oh-my-posh

### Setup
1. Nerd Fonts are installed automatically via `./setup.sh`
2. Configure your terminal to use **CascadiaCode Nerd Font**:
   - **macOS Terminal**: Terminal → Preferences → Profiles → Font
   - **iTerm2**: Preferences → Profiles → Text → Font
   - **Windows Terminal**: Settings → Profiles → Appearance → Font face

## Customization

### Adding Tools

**Linux**: Edit `machine_setup/ubuntu/main.yml` (Ansible playbook)

**macOS**: Edit `machine_setup/macos/Brewfile`
```ruby
# Add a formula
brew "package-name"

# Add a cask (GUI app)
cask "application-name"
```

Then run:
```bash
brew bundle --file=~/.dotfiles/machine_setup/macos/Brewfile
```

### Modifying Configs

**Shell aliases/functions**:
- Linux: Edit files in `.config/bash/`
- macOS: Edit files in `.config/zsh/`

**Program-specific configs**:
- Both platforms have parallel structures in `.config/bash/programs/` and `.config/zsh/programs/`
- Each program has separate `env.*` (environment) and `startup.*` (initialization) files

## Updating

### Update Dotfiles Repository
```bash
cd ~/.dotfiles
git pull
./install  # Re-run to update symlinks if needed
```

### Update System Packages

**Linux**:
```bash
sudo apt update && sudo apt upgrade
brew update && brew upgrade  # If using Homebrew on Linux
```

**macOS**:
```bash
brew update && brew upgrade
brew cleanup
```

### Update Individual Tools
```bash
# mise
mise self-update
mise upgrade

# Oh-my-posh
bash ~/.dotfiles/machine_setup/setup/oh_my_posh.sh
```

## Troubleshooting

### Homebrew not found (macOS)
After installing Homebrew, add it to your PATH:
```bash
# Apple Silicon
eval "$(/opt/homebrew/bin/brew shellenv)"

# Intel
eval "$(/usr/local/bin/brew shellenv)"
```

### Fonts not displaying correctly
1. Ensure CascadiaCode Nerd Font is installed in the system fonts directory
2. Configure your terminal to use "CaskaydiaCove Nerd Font"
3. Restart your terminal

### Oh-my-posh not loading
```bash
# Check if oh-my-posh is in PATH
which oh-my-posh

# Re-run setup
bash ~/.dotfiles/machine_setup/setup/oh_my_posh.sh

# Reload shell
source ~/.zshrc  # or ~/.bashrc
```

### Permission errors during setup
- **Linux**: Some commands require `sudo` (handled automatically)
- **macOS**: Homebrew installation may prompt for your password

## Directory Structure

```
.dotfiles/
├── .config/
│   ├── bash/              # Linux bash configurations
│   ├── zsh/               # macOS zsh configurations
│   ├── nvim/              # Neovim config (shared)
│   ├── tmux/              # Tmux config (shared)
│   └── oh-my-posh/        # Prompt themes (shared)
├── machine_setup/
│   ├── lib/               # Platform detection library
│   ├── macos/             # macOS-specific setup
│   │   ├── Brewfile       # Package manifest
│   │   ├── main.sh        # Setup orchestrator
│   │   └── helpers/       # Install scripts
│   ├── ubuntu/            # Linux-specific setup
│   │   ├── main.yml       # Ansible playbook
│   │   └── helpers/       # Install scripts
│   └── setup/             # Shared setup scripts
├── install                # Dotbot installer
├── install.conf.yaml      # Dotbot configuration
├── setup.sh               # Main setup script
└── post_install.sh        # Post-installation script
```

## Credits

- [Dotbot](https://github.com/anishathalye/dotbot) - Dotfile management
- [Oh-my-posh](https://ohmyposh.dev/) - Shell prompt theme engine
- [Nerd Fonts](https://www.nerdfonts.com/) - Icon fonts for developers

## License

Personal dotfiles configuration. Feel free to fork and customize for your own use.
