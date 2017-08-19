#!/usr/bin/env bash

# Exit after failed command
set -e

################################
### ANSIBLE SETUP ##############
################################

echo "Setting up system with Ansible ..."

ansible-playbook -v -i "localhost," -c local ansible.yml

echo "Ansible - DONE"

################################
### DOTBOT SETUP ###############
################################

# Dotbot configuration
CONFIG="dotbot.conf.yaml"
DOTBOT_MODULE="dotbot"
DOTBOT_BIN="bin/dotbot"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Run dotbot
cd "$BASEDIR"
git submodule update --init --recursive "$DOTBOT_MODULE"
"$BASEDIR/$DOTBOT_MODULE/$DOTBOT_BIN" -v -d "$BASEDIR" -c "$CONFIG" "${@}"

# Dotbot for emails
maildir="$BASEDIR/mail"
if [ -d "${maildir}" -a -r "${maildir}/${CONFIG}" ]; then
    "$BASEDIR/$DOTBOT_MODULE/$DOTBOT_BIN" -v -d "${maildir}" -c "${maildir}/$CONFIG" "${@}"
fi

