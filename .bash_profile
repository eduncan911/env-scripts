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
. /usr/share/virtualenvwrapper/virtualenvwrapper.sh
