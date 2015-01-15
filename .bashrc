source ~/.bash_profile

# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=100000
HISTFILESIZE=50000
HISTTIMEFORMAT="%d/%m/%y %T "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Custom prompt w/Git & History
# correct ANSI escapes: https://www.kirsle.net/wizards/ps1.html
source ~/git-prompt.sh
PROMPT_COMMAND='history -a;__git_ps1 "\[$(tput setaf 2)\]\u@\h \W\[$(tput sgr0)\]" "\[$(tput setaf 2)\] \\$ \[$(tput sgr0)\]"'

# Git helpers
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

# Copy Progress
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

# Xrandr functions
function xrandr1() {
  #xrandr --output VBOX1 --off
  xrandr --output Virtual2 --off
}
function xrandr2() {
  #xrandr --output VBOX1 --auto && xrandr --output VBOX1 --above VBOX0
  xrandr --output Virtual2 --auto && xrandr --output Virtual2 --above Virtual1
}
function xrandr3() { 
  #xrandr --output VBOX1 --auto && xrandr --output VBOX2 --auto && xrandr --output VBOX1 --right-of VBOX0 && xrandr --output VBOX2 --left-of VBOX0
  xrandr --output Virtual2 --auto && xrandr --output Virtual3 --auto && xrandr --output Virtual2 --right-of Virtual1 && xrandr --output Virtual3 --left-of Virtual1
}

# volume control (since a lack thereof in i3)
function vol() {
  if [ "$1" = "" ]; then
    echo "Usage: vol 50"
    echo "       vol +10"
    echo "       vol -5"
    return
  fi
  pactl set-sink-volume 0 -- "$1"% && pactl set-sink-mute 0 0
}

# Go cross-compiling functions
source ~/code/golang-crosscompile/crosscompile.bash

# monochrome vlc
alias nvlc='nvlc --no-color --browse-dir /media/sf_media/'
