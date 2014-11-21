export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

export RBENV_ROOT="$HOME/.rbenv/"
eval "$(rbenv init -)"

source ~/.git-prompt.sh
source ~/.git-completion.sh
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

alias db='bundle exec rails dbconsole'
alias pry='bundle exec pry -r ./config/environment'
alias guard='bundle exec guard'

alias rm='rm -i'
alias reload='source ~/.zshrc'

