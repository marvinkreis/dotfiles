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
ANTIGEN_BUNDLES=$HOME/git/antigen
ANTIGEN_AUTO_CONFIG=0
ANTIGEN_CLONE_OPTS="--depth=1"

source $HOME/.antigen/antigen.zsh

antigen bundle ohmyzsh/ohmyzsh lib/completion.zsh
antigen bundle ohmyzsh/ohmyzsh lib/key-bindings.zsh
antigen bundle ohmyzsh/ohmyzsh plugins/safe-paste/safe-paste-plugin.zsh
antigen bundle ohmyzsh/ohmyzsh plugins/jump/jump.plugin.zsh

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

export LS_COLORS="di=1;38;5;12:ex=1;38;5;10:fi=0:pi=38;5;3:so=38;5;5:bd=1;38;5;11:cd=38;5;3:ln=38;5;4:or=38;5;1"
export EXA_COLORS="reset:di=1;38;5;12:ex=1;38;5;10:fi=0:pi=38;5;3:so=38;5;5:bd=1;38;5;11:cd=38;5;3:ln=38;5;4:or=38;5;1:ur=38;5;2:uw=38;5;3:ux=38;5;1:ue=38;5;1:gr=38;5;2:gw=38;5;3:gx=38;5;1:tr=38;5;2:tw=38;5;3:tx=38;5;1:su=1;38;5;1:sf=1;38;5;1:xa=1;38;5;1:sn=38;5;5:sb=38;5;5:df=0:ds=0:uu=38;5;2:un=38;5;2:lc=0:lm=0:ga=38;5;2:gm=38;5;4:gd=38;5;1:gv=38;5;5:gt=38;5;6:xx=38;5;8:da=38;5;7:in=0:bl=0:hd=0:lp=1;38;5;12:cc=1;38;5;3:bO=0"
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# }}}

# Options: {{{
setopt histignorespace
setopt interactivecomments
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus
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

    rofi -modi file-browser-extended \
         -show file-browser-extended \
         -file-browser-dir "${dir}"  \
         -file-browser-depth 10      \
         -file-browser-stdout |
    while read line; do
        file=$(realpath --relative-to "${PWD}" "${line}")
        zle -U "\"${file}\" "
    done
}

zle -N rofi_file_browser_widget _rofi_file_browser
bindkey '^p' rofi_file_browser_widget

function _rofi_file_browser_open() {
    local dir

    if [ -d "${BUFFER##* }" ]; then
        dir="${BUFFER##* }"
    else
        dir="${PWD}"
    fi

    rofi -modi file-browser-extended \
         -show file-browser-extended \
         -file-browser-dir "${dir}"  \
         -file-browser-depth 10      \
}

zle -N rofi_file_browser_open_widget _rofi_file_browser_open
bindkey '^o' rofi_file_browser_open_widget
# }}}

# vim: fdm=marker:
