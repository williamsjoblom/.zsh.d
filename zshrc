# -*- mode: sh -*-

export CONF=jvmg # OpenJDK build configuration
export JDK="/home/wax/workbench/jdk/build/$CONF/jdk/bin/"
export JDKPROD="/home/wax/workbench/jdk/build/product/jdk/bin/"
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"

alias ccat="pygmentize -g -O style=colorful,linenos=1"
alias ec="emacsclient"
alias emacs-restart="systemctl --user restart emacs"

alias cov2="python2 -m coverage"
alias cov3="python3 -m coverage"

REPO=$( dirname $( realpath ${(%):-%N} ) ) # Configuration repo directory

# histfile config
HISTFILE=~/.histfile
HISTSIZE=1048576
SAVEHIST=$HISTSIZE
setopt hist_ignore_space

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

# Kill completion
zstyle ':completion:*:processes' command 'ps -ax'
zstyle ':completion:*:processes-names' command 'ps -aeo comm='
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:killall:*:processes-names' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:*:killall:*' menu yes select
