# enable control-s and control-q for vim
stty -ixon

# arguments: TC_BUILD_ID
download_scrub_main() {
  curl -X GET -H "Authorization: Basic AUTH123CODE" -o latest.main.dump -k "https://teamcity.ikayzo.com/httpAuth/app/rest/builds/id:$1/artifacts/content/scrubbed_main.pg"
}

# arguments: TC_BUILD_ID
download_scrub_support() {
  curl -X GET -H "Authorization: Basic AUTH123CODE" -o latest.support.dump -k "https://teamcity.ikayzo.com/httpAuth/app/rest/builds/id:$1/artifacts/content/scrubbed_support.pg"
}

# arguments: DB_NAME, DB_PORT
restore_scrub() {
  pg_restore --verbose --clean --disable-triggers --no-acl --no-owner -d "postgres://USER:PASS@localhost:$2/$1" -j 6 latest.main.dump
  pg_restore --verbose --clean --disable-triggers --no-acl --no-owner -d "postgres://USER:PASS@localhost:$2/$1_support" -j 6 latest.support.dump
}

# arguments: TC_BUILD_ID, DB_NAME, DB_PORT
download_restore_scrub() {
  download_scrub_main $1
  download_scrub_support $1
  restore_scrub $2 $3
}

dcb() {
  docker-compose run --rm $1 bundle exec ${@:2}
}

dck() {
  docker-compose kill
  docker-compose rm -f $1
}

# ex: $ tc_download TC_BUILD_ID
# ex: $ tc_go TC_BUILD_ID DB_NAME DB_PORT
# ex: $ tc_restore DB_NAME DB_PORT
alias tc_download=download_scrub_main
alias tc_go=download_restore_scrub
alias tc_restore=restore_scrub

alias drb="cd ~/work/drb-student-los"
alias drbp="cd ~/work/drb-personal-los"
alias drbfe="cd ~/work/drb-shared-fe"
alias drbs="cd ~/work/drb-shared"
alias sso="cd ~/work/drb-sso"

alias dcb=dcb
alias dck=dck
alias dcps="docker-compose ps"
