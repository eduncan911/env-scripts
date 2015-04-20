PATH="/home/eric/bin:$PATH"

# GO stuff
export GOPATH="$HOME/go"
export GOROOT="/usr/local/go"
PATH="$PATH:$GOROOT/bin:$GOPATH/bin"

# Ruby
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Python
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/code
export VIRTUAL_ENV_DISABLE_PROMPT=1
. /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# AWS credentials
export AWS_CREDENTIAL_FILE=~/Documents/aws_credentials.txt

