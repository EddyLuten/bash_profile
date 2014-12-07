#!/bin/bash

export EDITOR='atom --wait'

########## shell
alias cls='clear'
alias ls='ls -FGAhp'
alias ll='ls -l'
reload_profile() { source ~/.bash_profile; }

########## git

git config --global core.editor 'atom --wait'

# git auto-completion
if [ ! -f ~/git-completion.bash ]; then
  echo 'Downloading: git-completion.bash...'
  wget -q -O ~/git-completion.bash http://bit.ly/1u6N2MC
fi
source ~/git-completion.bash

# git prompt
if [ ! -f ~/git-prompt.sh ]; then
  echo 'Downloading: git-prompt.sh...'
  wget -q -O ~/git-prompt.sh http://bit.ly/1G4sFbd
fi
source ~/git-prompt.sh

# set PS1 to include git info
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export PS1='\e[39m\u$(__git_ps1 " [\[\e[0;32m\]%s\[\e[0m\]]")\$ '

# shortcuts
alias gC='git checkout'
alias gP='git pull'
alias gS='git status'
alias gR='git reset --soft HEAD~1'
alias gRR='git reset --hard HEAD'
alias ci='git commit -a'
gB() { git checkout -b $1; }

########## ruby / rails / etc.

# check if rbenv is installed and init
rbenv version >/dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi
