# **DOTFILES**

## HOW TO USE
#### You need to have **Ansible** and **Git** installed on your system to use the installation scripts.

    sudo dnf install ansible git
    
    cd ~
    git clone --recursive https://github.com/JohnHoder/dotfiles.git
    cd dotfiles && git remote 'set-url' --push origin git@github.com:JohnHoder/dotfiles.git
    
    sudo ./setupansible.sh
    (sudo) ./setupdotfiles.sh  -> sudo will install the dotfiles for sudo assigned user (root)

#### NOTE:
    chsh -s /usr/bin/zsh is not neccessarily needed as zsh is getting called from .bashrc

