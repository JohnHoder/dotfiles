### DOTFILES ###

### HOW TO USE ###

---
sudo dnf install ansible git

cd ~
git clone --recursive https://github.com/JohnHoder/dotfiles.git
cd dotfiles && git remote 'set-url' --push origin git@github.com:JohnHoder/dotfiles.git

sudo ./setupansible.sh
./setupdotfiles.sh
---

