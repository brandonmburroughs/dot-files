# Source aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Parse the git branch
function parse_git_branch () {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# CLI coloring and interface
export TERM="xterm-color" 
RED="\[\e[0;31m\]"
GREEN="\[\e[0;32m\]"
YELLOW="\[\e[0;33m\]"
BLUE="\[\e[0;34m\]"
NO_COLOR="\[\e[0m\]"
export PS1="$YELLOW"'\u'"$NO_COLOR"'@'"$BLUE"'\h'"$NO_COLOR"':'"$GREEN"'\w'"$RED"'$(parse_git_branch)'"$NO_COLOR"'\n\$ '

# Bash completion for GitHub branch names
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
