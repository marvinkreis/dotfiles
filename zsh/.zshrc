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
zstyle :compinstall filename '$HOME/.zshrc'

autoload -Uz compinit
compinit
# }}}

# zsh-newuser-install: {{{
HISTFILE=$HOME/.zsh_history
HISTSIZE=2500
SAVEHIST=1000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -v
# }}}

# Antigen: {{{
ADOTDIR=$HOME/git/antigen
source $HOME/git/antigen/antigen/antigen.zsh

antigen-use oh-my-zsh

antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle jump
antigen-bundle colored-man-pages
antigen-bundle sudo
antigen-bundle history

antigen-theme $HOME/.config/zsh/themes myLambda
# }}}

ZSH_CONFIG=$HOME/.config/zsh

source $ZSH_CONFIG/zsh_aliases
source $ZSH_CONFIG/zsh_functions
source $ZSH_CONFIG/zsh_completions

EDITOR=nvim
setopt histignorespace

# vim: fdm=marker:
