#
# ~/.bash_aliases
#
# Sourced from .bashrc for Interactive Bash sessions.

# make possibly distructive commands more interactive
#alias rm='rm -i'
#alias mv='mv -i'
#alias cp='cp -i'

# more intuitive options, and add a touch of color
alias pacman="pacmatic --color=auto"
alias grep='grep --color=auto --exclude-dir=\.git --exclude-dir=\.svn --exclude-dir=\.cache'

# more colors
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
fi

# general
alias nvlc='nvlc --no-color --browse-dir /media/sf_media/'
alias nautilus='nautilus --no-desktop'
alias files='nautilus --no-desktop'
alias ack='ack --color --passthru'
alias setclip='xclip -selection c'
alias getclip='xclip -selection clipboard -o'
alias dvtmd='dtach -A /tmp/dvtm-session -r winch dvtm'

# gitpending will transverse directories 1 level deep looking for repos
# with pending work
function gitpending() {
  for d in */ ; do
    pushd $d > /dev/null
    DIRNAME=$(basename "$d")

    if ! git diff-index --quiet HEAD --; then
      echo $DIRNAME
    fi

    popd > /dev/null
  done
}

# cpstat returns the progress of the first found "cp" process 
function cpstat() {
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
  xrandr --output Virtual3 --right-of Virtual1
}

# vol adjusts the volume
function vol() {
  if [ "$1" = "" ]; then
    echo "Usage: vol 50"
    echo "       vol +10"
    echo "       vol -5"
    return
  fi
  pactl set-sink-volume 0 "$1"% && pactl set-sink-mute 0 0
}

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# requires trash-cli installed
alias rm='echo -e "Use trash-* commands instead:\\n  trash-put           trashes files and directories.\n  trash-empty         empty the trashcan(s).\n  trash-list          list trashed file.\n  trash-restore       restore a trashed file.\n  trash-rm            remove individual files from trash can."; false'
