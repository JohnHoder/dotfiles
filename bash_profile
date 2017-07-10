# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/.local/bin:$HOME/bin

PATH=~/bin:$PATH
PATH=~/opt/sdk/platform-tools:$PATH

PATH=~/pebble-dev/pebble-sdk-4.4.1-linux64/bin:$PATH

export PATH

