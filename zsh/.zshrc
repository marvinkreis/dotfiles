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
HISTSIZE=100000
SAVEHIST=100000
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

antigen bundle ohmyzsh/ohmyzsh lib/completion.zsh
antigen bundle ohmyzsh/ohmyzsh lib/directories.zsh
antigen bundle ohmyzsh/ohmyzsh lib/git.zsh
antigen bundle ohmyzsh/ohmyzsh lib/key-bindings.zsh
antigen bundle ohmyzsh/ohmyzsh plugins/safe-paste

antigen bundle zsh-users/zsh-completions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle zdharma/history-search-multi-word

antigen bundle $HOME/.config/zsh/plugins
antigen theme $HOME/.config/zsh/themes lambda

antigen apply
# }}}

# Environment: {{{
PAGER='nvimpager -p'
MANPAGER='nvimpager -p'
ZSH_CONFIG=$HOME/.config/zsh
# }}}

source $ZSH_CONFIG/zsh-functions #TODO fpath
source $ZSH_CONFIG/zsh-aliases
source $ZSH_CONFIG/zsh-completions

# Rofi file browser: {{{
function _rofi_file_browser() {
    local dir file

    if [ -d "${BUFFER##* }" ]; then
        dir="${BUFFER##* }"
        BUFFER="${BUFFER% *} "
    else
        dir="${PWD}"
    fi

    rofi -show file-browser         \
         -file-browser-dir "${dir}" \
         -file-browser-depth 10     \
         -file-browser-stdout |
    while read line; do
        file=$(realpath --relative-to "${PWD}" "${line}")
        zle -U "\"${file}\" "
    done
}

zle -N rofi_file_browser_widget _rofi_file_browser
bindkey '^p' rofi_file_browser_widget
# }}}

# Options: {{{
setopt histignorespace
setopt interactivecomments
# }}}

# vim: fdm=marker:
