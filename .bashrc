alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gps='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gb='git branch'
alias gbD='git branch -D'
alias gs='git status'
alias gd='git diff'

alias drb='cd ~/Documents/Kiru/Repos/drb-student-los'
alias sso="cd ~/Documents/Kiru/Repos/drb-sso"
alias work='cd ~/Documents/Kiru/Repos'

# enable control-s and control-q for vim
stty -ixon

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

dcb() {
  docker-compose run --rm $1 bundle exec ${@:2}
}

dck() {
  docker-compose kill
  docker-compose rm -f $1
}

alias tc_download_scrub_main=download_scrub_main
alias tc_download_scrub_support=download_scrub_support
alias tc_go=download_restore_scrub
alias tc_restore=restore_scrub

alias dck=dck
alias dcb=dcb
alias dcps="docker-compose ps"
alias dcr="docker-compose run --rm"
alias dcu="docker-compose up -d"
alias dc="docker-compose"

