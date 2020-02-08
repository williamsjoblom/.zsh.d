# -*- mode: sh -*-
REPO=$( dirname $( realpath ${(%):-%N} ) ) # Configuration repo directory
HISTFILE=~/.histfile
HISTSIZE=2048
SAVEHIST=2048

setopt autocd
setopt extendedglob

# Enable emacs bindings.
bindkey -e
bindkey "^H" backward-kill-word # C-<Backspace>
bindkey "^[[3;5~" kill-word # C-<Del>

zstyle :compinstall filename '$HOME/.zshrc'
autoload -Uz compinit
compinit

# Fuzzy completion
zstyle ':completion:*' matcher-list '' \
  'm:{a-z\-}={A-Z\_}' \
  'r:[^[:alpha:]]||[[:alpha:]]=** r:|=* m:{a-z\-}={A-Z\_}' \
  'r:|?=** m:{a-z\-}={A-Z\_}'

# External packages.
source $REPO/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle shrink-path

antigen apply

# Bindings for zsh-history-substring-search
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# Theme
source $REPO/theme.zsh-theme
