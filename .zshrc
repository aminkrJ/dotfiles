export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin

# brew sed
PATH="/usr/local/opt/gnu-sed/libexec/gnubin:$PATH"

export RBENV_ROOT="$HOME/.rbenv/"
eval "$(rbenv init -)"

source ~/.git-prompt.sh
source ~/.git-completion.sh
setopt PROMPT_SUBST ; PS1='[%n@%m %c$(__git_ps1 " (%s)")]\$ '

alias db='bundle exec rails dbconsole'
alias pry='bundle exec pry -r ./config/environment'
alias guard='bundle exec guard'
alias teaspoon='bundle exec teaspoon'
alias migrate='bundle exec rake db:migrate'
alias rollback='bundle exec rake db:rollback'

alias ctags='ctags -R .'

alias rm='rm -i'
alias reload='source ~/.zshrc'

