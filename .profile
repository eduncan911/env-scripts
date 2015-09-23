#
# ~/.profile
#
# Used for things not related to bash. Environment vars, PATH and related. 
# Should be available anytime.  Loaded by GUIs, Sublime, etc.

# Path
PATH="$HOME/bin:$PATH"

# Ruby rbenv
[[ -d "$HOME/.rbenv" ]] && PATH="$HOME/.rbenv/bin:$PATH"

# Python
WORKON_HOME=$HOME/.virtualenvs; export WORKON_HOME
PROJECT_HOME=$HOME/code; export PROJECT_HOME
VIRTUAL_ENV_DISABLE_PROMPT=1; export VIRTUAL_ENV_DISABLE_PROMPT
#VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3

# GO stuff
GOPATH="$HOME/go"; export GOPATH
GOROOT="/usr/local/go"; export GOROOT
PATH="$GOPATH/bin:$GOROOT/bin:$PATH"

# since PATH was modified several times, export it here
export PATH

# AWS credentials
AWS_CREDENTIAL_FILE=~/Documents/aws_credentials.txt
export AWS_CREDENTIAL_FILE

# setup a terminal (i3's sensible terminal)
TERMINAL=/usr/bin/gnome-terminal
#TERM=xterm-256color
#TERM=rxvt-unicode-256color
export TERMINAL
#export TERM
[[ -s "/usr/bin/dircolors" ]] && eval `dircolors ~/.dircolors`

# setup Gnome's settings and keyring
#export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
