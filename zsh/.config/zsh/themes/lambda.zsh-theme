setopt promptsubst

# function short_pwd {
#     local pwd="${PWD/#$HOME/~}"
#     if [[ "$pwd" == (#m)[/~] ]]; then
#         _short_pwd="$MATCH"
#     else
#         _short_pwd="${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}/${pwd:t}"
#     fi
#     echo $_short_pwd
# }

function trunc_pwd {
    local pwd="${PWD/#${HOME}/~}"
    local prefix=''
    local old_pwd=''

    while (( ${#pwd} > $(( ${COLUMNS} / 3 )) )) && [[ "${old_pwd}" != "${pwd}" ]]; do
        old_pwd="${pwd}"
        pwd="${pwd#*/}"
        prefix='../'
    done

    echo "${prefix}${pwd}"
}

function trunc_git_branch {
    local branch="$(git branch --show-current 2> /dev/null)"

    if [[ "${branch}" -ne '' ]]; then
        if (( ${#branch} > $(( ${COLUMNS} / 4 )) )); then
            branch="${branch:0:$(( ${COLUMNS} / 4 ))}.."
        fi
        echo "${branch} "
    fi
}

function inc_ncmds {
    NCMDS=$(( ${NCMDS} + 1 ))
}

function get_retval {
    RETVAL="${?}"
    if [[ "${RETVAL}" -ne "0" ]] && [[ "${NCMDS}" -ne "${PREV_NCMDS}" ]]; then
        PREV_NCMDS="${NCMDS}"
    else
        RETVAL=0
    fi
}

function exit_symbol {
    if [[ "${RETVAL}" -ne "0" ]] && [[ "${RETVAL}" -ne "130" ]]; then
        echo "[${RETVAL}] "
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec inc_ncmds
add-zsh-hook precmd get_retval

# Colors
reset_fg="%{[39m%}"
reset_bg="%{[49m%}"
# bgcolor_bg="%{[48;5;233m%}"
# bgcolor_fg="%{[38;5;233m%}"
color_time="%{[38;5;7m%}"
color_name="%{[38;5;1m%}"
color_pwd="%{[38;5;12m%}"
color_git="%{[38;5;4m%}"
color_false="%{[38;5;1m%}"

# Prompt
PROMPT=''
# PROMPT+='${bgcolor_bg}'
PROMPT+='${color_time}[%*]${reset_fg} '
PROMPT+='${color_name}%n${reset_fg} '
PROMPT+='${color_pwd}$(trunc_pwd)${reset_fg} '
PROMPT+='${color_git}$(trunc_git_branch)${reset_fg}'
PROMPT+='${color_false}$(exit_symbol)${reset_fg}'
PROMPT+='λ '
# PROMPT+='${reset_bg}'
# PROMPT+='${bgcolor_fg}${reset_fg} '

# Right-side prompt
# RPROMPT=''
# RPROMPT+='${color_false}$(exit_symbol)${reset_color}'
# RPROMPT+='${color_time}%*${reset_color}'
