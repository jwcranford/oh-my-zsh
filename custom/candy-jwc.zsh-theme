# modified version of candy theme
# - added return status and history #

local ret_status="%(?::%{$fg[red]%}➜%? %{$reset_color%})"

PROMPT=$'${ret_status}%{$fg[blue]%}%D{[%X]}

%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg[white]%}[%(3~|.../%2~|%~)]%{$reset_color%} $(git_prompt_info)\
%{$fg_bold[blue]%}%!%{$fg_bold[blue]%} %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}<"
ZSH_THEME_GIT_PROMPT_SUFFIX=">%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
