LHS='%30<…<%~%<<'
PROMPT='%(?,%{$fg_bold[grey]%}$LHS,%{$fg[red]%}$LHS) %{$reset_color%}'
RPS1='$(git_prompt_info) %{$fg[white]%}%T%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}⚡%{$fg[yellow]%}"
