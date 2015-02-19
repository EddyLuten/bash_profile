#!/bin/bash

export VISUAL=vim
export EDITOR="$VISUAL"

########## shell

alias cd..='cd ..'
alias cls='clear'
alias ls='ls -f1 -FGahp'
alias ll='ls -l'
alias t='cls;rake spec'
reload_profile() { source ~/.bash_profile; }

########## git

git config --global core.editor vim
git config --global color.ui true
git config --global format.pretty oneline
git config --global core.autocrl input
git config --global core.fileMode true

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
export PS1="\[\033[38m\]\u\[\033[32m\] \w \[\033[31m\]\`ruby -e \"print (%x{git branch 2> /dev/null}.split(%r{\n}).grep(/^\*/).first || '').gsub(/^\* (.+)$/, '(\1) ')\"\`\[\033[37m\]$\[\033[00m\] "

# shortcuts
alias gc='git checkout'
alias gp='git pull'
alias gs='git status'
alias gr='git reset --soft HEAD~1'
alias grr='git reset --hard HEAD'
alias ci='git commit -a'
gb() { git checkout -b $1; }

# works like rm, but moves files to the trash
alias trash='set -f;trash'
trash() {
  set +f
  cp -pR $1 ~/.Trash/
  rm -r $1
}

# empty the trash
empty_trash() {
  rm -r ~/.Trash/*
}

########## ruby / rails / etc.

# check if rbenv is installed and init
rbenv version >/dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi
