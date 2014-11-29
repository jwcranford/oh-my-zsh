# -*- shell-script -*-

local ret_status="%(?::%{$fg_bold[red]%}➜ %? %{$reset_color%})"

# get the name of the branch we are on
function custom_git_prompt_info() {
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
  fi
}

# Checks if working tree is dirty and gone/ahead/behind
# Borrows some from git-prompt plugin
function parse_git_status() {
  local STATUS=''
  local FLAGS
  local AHEAD=''
  local COUNT=''
  local PIECE=''
  FLAGS=('--porcelain' '-b')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null)
  fi
  
  if [[ $(echo $STATUS | wc -l) -gt 1 ]]; then
    echo -n "$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    echo -n "$ZSH_THEME_GIT_PROMPT_CLEAN"
  fi
  AHEAD=$(echo $STATUS | head -1 | cut -f 2 -d \[)
  if echo $STATUS | grep gone >/dev/null; then
      echo -n 'Ø'
  else
      PIECE=$( echo $STATUS | grep -Eo 'ahead [0-9]*' )
      if [[ $? -eq 0 ]]; then
	  COUNT=$( echo $PIECE | cut -f 2 -d ' ')
	  echo -n "↑$COUNT"
      fi 
      PIECE=$( echo $STATUS | grep -Eo 'behind [0-9]*' )
      if [[ $? -eq 0 ]]; then
	  COUNT=$( echo $PIECE | cut -f 2 -d ' ')
	  echo -n "↓$COUNT"
      fi 
  fi
}


PROMPT='
${ret_status}%{$fg_bold[blue]%}%5~%{$reset_color%} $(custom_git_prompt_info)
%{$fg_bold[green]%}%T %! %#%{$reset_color%} '
#RPROMPT='[%T]'
RPROMPT=

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[cyan]%}[%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[cyan]%}]%{$reset_color%} "
