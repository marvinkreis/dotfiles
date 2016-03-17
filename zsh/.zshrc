# compinstall: {{{
zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' menu select=1
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle :compinstall filename '/home/marvin/.zshrc'

autoload -Uz compinit
compinit
# }}}

# zsh-newuser-install: {{{
HISTFILE=~/.zsh_history
HISTSIZE=2500
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -v
# }}}

# Antigen: {{{
source $HOME/.antigen/antigen/antigen.zsh

antigen-use oh-my-zsh

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle jump
antigen-bundle colored-man-pages

antigen-theme /home/marvin/.antigen/themes myLambda
# }}}

source $HOME/.zsh_aliases
source $HOME/.zsh_functions
