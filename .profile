#
# ~/.profile
#
# Used for things not related to bash. Environment vars, PATH and related. 
# Should be available anytime.  Loaded by GUIs, Sublime, etc.

# Path
PATH="$HOME/bin:$PATH"

# GO stuff
GOPATH="$HOME/go"; export GOPATH
GOROOT="/usr/local/go"; export GOROOT
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Ruby
#PATH="$HOME/.rbenv/bin:$PATH"
#eval "$(rbenv init -)"

# Python
#WORKON_HOME=$HOME/.virtualenvs; export WORKON_HOME
#PROJECT_HOME=$HOME/code; export PROJECT_HOME
#VIRTUAL_ENV_DISABLE_PROMPT=1; export VIRTUAL_ENV_DISABLE_PROMPT

# AWS credentials
#AWS_CREDENTIAL_FILE=~/Documents/aws_credentials.txt; export AWS_CREDENTIAL_FILE

# since PATH was modified several times, export it here
export PATH
