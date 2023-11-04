# -*- shell-script -*-

local ret_status="%(?::%{$fg_bold[red]%}➜ %? %{$reset_color%})"

autoload -Uz vcs_info
precmd() { vcs_info }

zstyle ':vcs_info:*' enable git


PROMPT='
${ret_status}%{$fg_bold[blue]%}%5~%{$reset_color%} %{$fg_no_bold[magenta]%}$vcs_info_msg_0%{$reset_color%}
%{$fg_no_bold[yellow]%}%T %! %#%{$reset_color%} '
#RPROMPT='[%T]'
RPROMPT=

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%}]%{$reset_color%} "
