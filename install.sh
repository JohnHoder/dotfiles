#!/usr/bin/env bash

set -e
git clone --recursive https://github.com/JohnHoder/dotfiles.git
cd dotfiles && git remote 'set-url' --push origin git@github.com:JohnHoder/dotfiles.git

exec ./setupansible.sh
exec ./setupdotfiles.sh

