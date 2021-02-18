# -*- mode: sh -*-
setopt prompt_subst
PROMPT="[%D{%M:%S}] "
PROMPT+="%(?:%{$fg_bold[green]%}➜ :%{$fg_bold[red]%}➜ )"    # Arrow
PROMPT+=' %{$fg[cyan]%}$(shrink_path -f)%{$reset_color%} ' # Path
PROMPT+='$(git_prompt_info)'                               # Git

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
