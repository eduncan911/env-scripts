# aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias nvlc='nvlc --no-color --browse-dir /media/sf_media/'
alias nautilus='nautilus --no-desktop'
alias files='nautilus --no-desktop'
alias ack='ack-grep --color --passthru'

# history
HISTSIZE=1000000
HISTFILESIZE=500000
HISTTIMEFORMAT="%d/%m/%y %T "

# color prompt w/Git: correct ANSI escapes: https://www.kirsle.net/wizards/ps1.html
function virtualenv_info(){
    # Get Virtual Env
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Strip out the path and just leave the env name
        venv="${VIRTUAL_ENV##*/}"
    else
        # In case you don't have one activated
        venv=''
    fi
    [[ -n "$venv" ]] && echo "[$venv] "
}
VENV="\$(virtualenv_info)";
export PROMPT_COMMAND='history -a;__git_ps1 "\[$(tput setaf 2)\]\u@\h:\W\[$(tput sgr0)\]" " \[$(tput setaf 6)\]${VENV}\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"'

# functions
function gitpending()
{
  for d in */ ; do
    pushd $d > /dev/null
    DIRNAME=$(basename "$d")

    if ! git diff-index --quiet HEAD --; then
      echo $DIRNAME
    fi

    popd > /dev/null
  done
}

function cpstat()
{
  local pid="${1:-$(pgrep -xn cp)}" src dst
  [[ "$pid" ]] || return
  while [[ -f "/proc/$pid/fd/3" ]]; do
    read src dst < <(stat -L --printf '%s ' "/proc/$pid/fd/"{3,4})
    (( src )) || break
    printf 'cp %d%%\r' $((dst*100/src))
    sleep 1
  done
  echo
}

function xrandr1() {
  #xrandr --output VBOX1 --off
  xrandr --output Virtual1 --auto
  xrandr --output Virtual2 --off
  xrandr --output Virtual3 --off
}
function xrandr2() {
  #xrandr --output VBOX1 --auto && xrandr --output VBOX1 --above VBOX0
  xrandr --output Virtual1 --auto
  xrandr --output Virtual2 --auto
  xrandr --output Virtual3 --off
  xrandr --output Virtual2 --above Virtual1
}
function xrandr3() { 
  #xrandr --output VBOX1 --auto && xrandr --output VBOX2 --auto && xrandr --output VBOX1 --right-of VBOX0 && xrandr --output VBOX2 --left-of VBOX0
  xrandr --output Virtual1 --auto
  xrandr --output Virtual2 --auto
  xrandr --output Virtual3 --auto
  xrandr --output Virtual2 --left-of Virtual1
  xrandr --output Virtual3 --left-of Virtual2
}

function vol() {
  if [ "$1" = "" ]; then
    echo "Usage: vol 50"
    echo "       vol +10"
    echo "       vol -5"
    return
  fi
  pactl set-sink-volume 0 -- "$1"% && pactl set-sink-mute 0 0
}
