- run `sudo apt-get upgrade -y && sudo apt-get update -y && sudo apt-get install ansible -y`
- clone repo `git clone ceramey1997/dotfiles ~/.dotfiles`
- setup variables for git configuration
    - `export GIT_USER_EMAIL=<email>`
    - `export GIT_USER_NAME=<your name>`
- cd into `.dotfiles` and execute `./install`
- cd into `machine_setup/ubuntu`
- run `ansible-playbook main.yml`
- run `source ~/.bashrc`


## 1Password CLI
1) Ensure 1password desktop is setup
1) Follow this [guide](developer.1password.com/docs/ssh/get-started) for windows.
1) Follow this [readme](https://gist.github.com/WillianTomaz/a972f544cc201d3fbc8cd1f6aeccef51) to set-up 1password & wsl setup.


## oh-my-posh
1) Install a nerd font and put it in the appropriate windows folder.
1) select that font for the distro in your WSL settings
