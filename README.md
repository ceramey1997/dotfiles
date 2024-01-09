- run `sudo apt-get upgrade -y && sudo apt-get update -y && sudo apt-get install ansible -y`
- clone repo `git clone ceramey1997/dotfiles ~/.dotfiles`
- setup variables for git configuration
    - NOTE: for mult-use: create a `local_setup` folder in `.dotfiles` with scripts to help setup with vars (its ignored)
    - `export GIT_USER_EMAIL=<email>`
    - `export GIT_USER_NAME=<your name>`
    - `export GIT_SIGNING_KEY=<your public ssh key>`
    - `export GIT_GPG_SSH_PROGRAM=<[/mnt/c/Users/USER/AppData/Local/1Password/app/8/op-ssh-sign-wsl] or path>`
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
