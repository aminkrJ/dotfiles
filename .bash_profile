[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

#git auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

#completion for ssh, config + known_hosts
_complete_ssh_hosts () {
          COMPREPLY=()
          cur="${COMP_WORDS[COMP_CWORD]}"
          comp_ssh_hosts=`cat ~/.ssh/known_hosts | cut -f 1 -d ' ' | sed -e s/,.*//g | grep -v ^# | uniq | grep -o '\[[a-z\.0-1]*\]' | sed -e s/\\\[\//g | sed -e s/\\\]\//g
            if [ -f ~/.ssh/config ]; then
              cat ~/.ssh/config | grep "Host " | sed -e s/Host\ //g | tr '\n' ' ' | awk '{n=split($0,a," "); for (i=0; ++i <= n;) print a[i]}' | grep -v '*'
            fi`
            COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
            return 0
          }
          # SSH autocomplete, just config
          complete -o default -o nospace -W "$(grep -i -e '^Host ' ~/.ssh/config | awk '{print substr($0, index($0,$2))}' ORS=' ' )" ssh scp sftp
# This is needed for deployment to TEST enviroment etc.
alias sa='ssh-add ~/.ssh/id_rsa'
