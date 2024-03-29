# [HardC0re] dotfiles

## How to use

You need to have **Ansible** and **Git** installed on your system to use the installation scripts.

    sudo dnf install ansible git

    git clone https://github.com/JohnHoder/dotfiles.git
    
    cd dotfiles/

    sudo ./setupansible.sh
    (sudo) ./setupdotfiles.sh   -> sudo will install the dotfiles for sudo assigned user (root)

## Note
Running command `chsh -s /usr/bin/zsh` is not needed as `zsh` is getting called from `.bashrc`.
Recursive repo clone (`git clone --recursive https://github.com/JohnHoder/dotfiles.git`) is not needed. The subrepository `dotbot` will be synced automatically by running `setupdotfiles.sh`.

## To push changes to this repo
For HTTPS (HTTPS authentication not supported by Github anymore):

    git remote set-url origin https://github.com/JohnHoder/dotfiles.git

For SSH:

    git remote set-url origin git@github.com:JohnHoder/dotfiles.git


## Debug Conky

	conky -D -c ~/.config/conky/rightpanel/conkyrc_rightpanel
	conky -D -c ~/.config/conky/trello/trelloconkyrc
	pkill conky
