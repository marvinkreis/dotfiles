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
HISTSIZE=25000
SAVEHIST=10000
setopt appendhistory extendedglob notify
unsetopt autocd beep nomatch
bindkey -v
# }}}

# Antigen: {{{
ADOTDIR=$HOME/.antigen
ANTIGEN_BUNDLES=$HOME/git/antigen/bundles
ANTIGEN_AUTO_CONFIG=0
ANTIGEN_CLONE_OPTS="--depth=1"

source $HOME/.antigen/antigen/antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/directories.zsh
antigen bundle robbyrussell/oh-my-zsh lib/git.zsh
antigen bundle robbyrussell/oh-my-zsh lib/key-bindings.zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zdharma/history-search-multi-word

antigen bundle $HOME/.config/zsh/plugins
antigen theme $HOME/.config/zsh/themes lambda

antigen apply
# }}}

ZSH_CONFIG=$HOME/.config/zsh
PAGER='nvimpager -p'
MANPAGER='nvimpager -p'

source $ZSH_CONFIG/zsh-functions #TODO fpath
source $ZSH_CONFIG/zsh-aliases
source $ZSH_CONFIG/zsh-completions

# Options: {{{
setopt histignorespace
setopt interactivecomments
# }}}

# vim: fdm=marker:


