# **DOTFILES**

## HOW TO USE
#### You have to have **Ansible** and **Git** installed on your system to use these scripts.

    sudo dnf install ansible git
    
    cd ~
    git clone --recursive https://github.com/JohnHoder/dotfiles.git
    cd dotfiles && git remote 'set-url' --push origin git@github.com:JohnHoder/dotfiles.git
    
    sudo ./setupansible.sh
    ./setupdotfiles.sh


