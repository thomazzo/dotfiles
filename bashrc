# add colors to terminal
export CLICOLOR=1

alias cl="clear && cd"
# case insensitive completion
bind "set completion-ignore-case on"

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# git branch in PS1
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\u \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "

export PYTHONDONTWRITEBYTECODE="dontwritebytecode"
alias starwars="telnet towel.blinkenlights.nl"

# stack autocompletion
eval "$(stack --bash-completion-script stack)"

# add .local/bin to path
PATH=$PATH:~/.local/bin

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

alias nv="nvim"

export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/go/bin:$PATH"
