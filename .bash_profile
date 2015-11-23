#!/bin/bash

export VISUAL=vim
export EDITOR="$VISUAL"

########## shell

alias cd..='cd ..'
alias cls='clear'
alias ls='ls -f1 -FGahp'
alias ll='ls -l'
alias t='cls;rake spec'
alias bu='bundle update'
alias bi='bundle install'
alias fs='foreman start'
reload_profile() { source ~/.bash_profile; }

########## git

git config --global core.editor vim
git config --global color.ui true
git config --global format.pretty "%Cred%h%C(white) - %Cblue%an: %C(white)%s %Cgreen(%cr)%Creset"
git config --global core.autocrl input
git config --global core.fileMode true

# aliases
git config --global alias.incoming "!(git fetch --quiet && git log --pretty=format:'%C(yellow)%h %C(white)- %C(red)%an %C(white)- %C(cyan)%d%Creset %s %C(white)- %ar%Creset' ..@{u})"
git config --global alias.outgoing "!(git fetch --quiet && git log --pretty=format:'%C(yellow)%h %C(white)- %C(red)%an %C(white)- %C(cyan)%d%Creset %s %C(white)- %ar%Creset' @{u}..)"
git config --global alias.dirty-branches '!(git branch --merged development | grep -v development | egrep -v "(development|master)")'
git config --global alias.clean-branches '!(git branch --merged development | egrep -v "(development|master)" | xargs -n 1 git branch -d)'
git config --global alias.push-branch '!(git rev-parse --abbrev-ref HEAD | xargs -J % git push --set-upstream origin %)'

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
alias gcm='git checkout master'
alias gcd='git checkout development'
alias gp='git pull'
alias gs='git status'
alias gr='git reset --soft HEAD~1'
alias grr='git reset --hard HEAD'
alias ci='git commit -a'
gb() { git checkout -b $1; }
alias gd='git branch -D'
alias gl='git branch -lvv'
alias gla='git branch -avv'
alias glr='git branch -rvv'

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
which rbenv >/dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi

########## hitch setup
hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}
alias unhitch='hitch -u'

########## set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)

########## self-update
update_profile() {
  (cd ~/bash_profile && git pull) >/dev/null
  reload_profile
}
