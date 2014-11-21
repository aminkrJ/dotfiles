export RBENV_ROOT=/usr/local/var/rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#git auto-complete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

#aliases
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# This is needed for deployment to TEST enviroment etc.
alias sa='ssh-add ~/.ssh/id_rsa'

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



# git branch in prompt
_parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
prompt_user="\u"
prompt_path="\w"
prompt_git_branch='$(_parse_git_branch)'
prompt_time="\t"
export PS1="\[$Red\]$prompt_user\[$NC\][\[$Cyan\]$prompt_path\[$NC\]]\[$Purple\]$prompt_git_branch\[$NC\] $ "
