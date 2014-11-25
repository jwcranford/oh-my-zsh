local ret_status="%(?:%{$fg_bold[green]%}➜ %{$reset_color%}:%{$fg_bold[red]%}➜ %?%{$reset_color%})"

PROMPT='${ret_status} %{$fg_bold[blue]%}%5~%{$reset_color%} $(git_prompt_info)%! %# '
RPROMPT='[%T]'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_no_bold[cyan]%}["
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg_bold[red]%}✗ "
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_no_bold[cyan]%}]%{$reset_color%} "
