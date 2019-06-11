export BASH_CONF="bashrc"

# curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
source ~/.git-completion.bash

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;34m\]\w\[\033[00m\]\$ '

alias drb='cd ~/Documents/Kiru/Repos/drb-student-los'
alias drbp="cd ~/Documents/Kiru/Repos/drb-personal-los"
alias drbs="cd ~/Documents/Kiru/Repos/drb-shared"
alias drbg="cd ~/Documents/Kiru/Repos/drb-shared-gulp"
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
alias dcl="docker-compose logs -f"

# after brew install redis@3.2
export PATH="/usr/local/opt/redis@3.2/bin:$PATH"
# after brew install postgresql@9.6
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
