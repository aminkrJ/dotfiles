eval "$(rbenv init -)"

# git branch in prompt
_parse_git_branch () {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
prompt_user="\u"
prompt_path="\w"
prompt_git_branch='$(_parse_git_branch)'
prompt_time="\t"
export PS1="\[$Red\]$prompt_user\[$NC\][\[$Cyan\]$prompt_path\[$NC\]]\[$Purple\]$prompt_git_branch\[$NC\] $ "
