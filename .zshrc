autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats '%b '

setopt PROMPT_SUBST
PROMPT='%F{green}%*%f %F{cyan}%~%f %F{red}${vcs_info_msg_0_}%f$ '

# Git completion setup
fpath=(~/.zsh $fpath)
autoload -Uz +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit

alias dcps="docker-compose ps"
alias dcr="docker-compose run --rm"
alias dcu="docker-compose up -d"
alias dc="docker-compose"
alias dcl="docker-compose logs -f"

alias kport='function _kport(){ sudo kill -9 $(lsof -t -i:$1); };_kport'

alias mhub="cd ~/Documents/Github/proj-titan/modelhub"
alias mui="cd ~/Documents/Github/proj-titan/modelhub-ui"
alias infra="cd ~/Documents/Github/proj-titan/infra"
alias button="cd ~/Documents/Github/proj-titan/button"
alias pii="cd ~/Documents/Github/proj-titan/pii-api"

alias gptfe="cd ~/Documents/GitHub/diligencegpt-fe"
alias gpt="cd ~/Documents/GitHub/startupfuel"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"

[ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"