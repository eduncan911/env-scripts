#
# ~/.bashrc
#
# Used for Interactive Bash sessions.  Bash aliases, setting favorite editor and bash prompt, etc.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# enable bash aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# enable bash completion
if [ -f /etc/bash_completion ]; then
  source /etc/bash_completion
fi

# modify bash behavior
shopt -s histappend
shopt -s checkwinsize
shopt -s cdspell
shopt -s dirspell
shopt -s cmdhist

# history: setting to unlimited
HISTCONTROL=ignoreboth:ignoredups:erasedups
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="[%F %T] "
HISTFILE=~/.bash_history_unlimited

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you dont need to enable
# this, if its already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# sort ls hidden files first
LC_COLLATE="C"; export LC_COLLATE

# default editor
EDITOR=nano; export EDITOR

# source external scripts
#source /usr/share/virtualenvwrapper/virtualenvwrapper.sh		# PROMPT: Python VirtualEnvWrapper
source /home/eric/bin/posh-git-prompt.sh						# PROMPT: POSH-stype Git Prompt
source /home/eric/code/golang-crosscompile/crosscompile.bash 	# GO: cross-compiling

# color prompt w/Git: correct ANSI escapes: https://www.kirsle.net/wizards/ps1.html
function __prompt_set_titlebar {
    case $TERM in
        *xterm*|ansi|rxvt)
            #printf "\033]0;%s\007" "$*"
            #printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"
            printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "$*"
            ;;
    esac
}
function __prompt_get_dir {
    printf "%s" $(pwd | sed "s:$HOME/code/:/:" | sed "s:$HOME/go/src/github.com/:/:" | sed "s:$HOME/go/src/:/:" | sed "s:$HOME:~:" )
}
function __prompt_virtualenv_info {
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
function __prompt_is_in_git_repo {
    local repo_info="$(git rev-parse --git-dir --is-inside-git-dir \
		--is-bare-repository --is-inside-work-tree \
		--short HEAD 2>/dev/null)"
    local rev_parse_exit_code="$?"
    if [ -z "$repo_info" ]; then
        return 1
    elif [ "$rev_parse_exit_code" -ne "0" ]; then
        return 1
    else
        return 0
    fi
}
function __prompt_fmt_time {
  if [ '' = "PM" ]; then
    meridiem="pm"
  else
    meridiem="am"
  fi
  date +"%l:%M:%S$meridiem"|sed 's/ //g'
}
function __prompt_pwd {
  pwd | awk -F\/ '{print $(NF-1),$(NF)}' | sed 's/ /\//'
}
function __prompt_command {

  __PROMPT_COLOR_NORMAL="\[$(tput sgr0)\]\[$(tput setaf 8)\]"
  __PROMPT_COLOR_TEXT="\[$(tput setaf 15)\]"
  __PROMPT_COLOR_ERROR="\[$(tput setaf 1)\]"
  __PROMPT_COLOR_RESET="\[$(tput sgr0)\]"

  local ERRORPROMPT=""
  if [ $? -ne 0 ]; then 
    ERRORPROMPT='$?' 
  fi

  local GITINFO=""
  if [ __prompt_is_in_git_repo ]; then 
    GITINFO="\$(__git_ps1 'pre' 'post' '')"
  fi

  local TIME=`__prompt_fmt_time`
  
  PROMPT_COMMAND='__git_ps1 \
"`err=\$?; if [[ $err -ne "0" ]]; then echo $__PROMPT_COLOR_ERROR"└─────("$err")─────┘"$__PROMPT_COLOR_RESET"\n"; fi`\
$__PROMPT_COLOR_NORMAL┌($__PROMPT_COLOR_TEXT$(__prompt_fmt_time)$__PROMPT_COLOR_NORMAL)$__PROMPT_COLOR_RESET" \
"\n$__PROMPT_COLOR_NORMAL└($__PROMPT_COLOR_TEXT\u@\h$__PROMPT_COLOR_NORMAL)─($__PROMPT_COLOR_TEXT$(__prompt_pwd 3)$__PROMPT_COLOR_NORMAL) $__PROMPT_COLOR_RESET\$ " \
"$__PROMPT_COLOR_NORMAL─($__PROMPT_COLOR_RESET%s$__PROMPT_COLOR_NORMAL)$__PROMPT_COLOR_RESET";\
__prompt_set_titlebar "$(__prompt_get_dir)";\
history -a'
  
}

#PS1='[\u@\h \W]\$ '
PS2='> '
PS3='> '
PS4='+ '
case ${TERM} in
    xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
        #VENV="\$(__virtualenv_info)"
        #PROMPT_COMMAND='history -a;__git_ps1 "\[$(tput setaf 2)\]\u@\h:\W\[$(tput sgr0)\]" " \[$(tput setaf 6)\]${VENV}\[$(tput setaf 2)\]\\$ \[$(tput sgr0)\]"; __set_titlebar "$(__get_dir)"'
        GIT_PS1_SHOWUPSTREAM="auto"
        PROMPT_COMMAND=__prompt_command
        unset VENV
        ;;
    screen)
    	# TODO: change to a unique color for screens
        #VENV="\$(__virtualenv_info)"
        GIT_PS1_SHOWUPSTREAM="auto"
        PROMPT_COMMAND=__prompt_command
        unset VENV
        ;;
    *)
       [ -e /etc/sysconfig/bash-prompt-default ] && PROMPT_COMMAND=/etc/sysconfig/bash-prompt-default
       ;;
esac
__prompt_command


