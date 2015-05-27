#
# ~/.profile
#
# Used for things not related to bash. Environment vars, PATH and related. 
# Should be available anytime.  Loaded by GUIs, Sublime, etc.

# Path
PATH="$HOME/bin:$PATH"

# Ruby
#PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"
PATH="$HOME/.rvm/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# Python
#WORKON_HOME=$HOME/.virtualenvs; export WORKON_HOME
#PROJECT_HOME=$HOME/code; export PROJECT_HOME
#VIRTUAL_ENV_DISABLE_PROMPT=1; export VIRTUAL_ENV_DISABLE_PROMPT

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
TERM=xterm-256color
#TERM=rxvt-unicode-256color
export TERMINAL
export TERM
eval `dircolors ~/.dircolors`

# setup Gnome's settings and keyring
export $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)
