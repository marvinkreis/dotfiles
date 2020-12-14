setopt promptsubst

function short_pwd {
    local pwd="${PWD/#$HOME/~}"
    if [[ "$pwd" == (#m)[/~] ]]; then
        _short_pwd="$MATCH"
    else
        _short_pwd="${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}/${pwd:t}"
    fi
    echo $_short_pwd
}

function trunc_pwd {
    local pwd="${PWD/#${HOME}/~}"
    local prefix=''
    local old_pwd=""

    while (( ${#pwd} > $(( ${COLUMNS} / 3 )) )) && [[ "${old_pwd}" != "${pwd}" ]]; do
        old_pwd="${pwd}"
        pwd="${pwd#*/}"
        prefix='../'
    done

    echo "${prefix}${pwd}"
}

function trunc_git_branch {
    branch="$(git branch --show-current 2> /dev/null)"

    if [ $? -eq 0 ]; then
        if (( ${#branch} > $(( ${COLUMNS} / 3 )) )); then
            branch="${branch:0:$(( ${COLUMNS} / 3 ))}.."
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
    if [[ "${RETVAL}" -ne "0" ]]; then
        echo "[${RETVAL}] "
    fi
}

autoload -Uz add-zsh-hook
add-zsh-hook preexec inc_ncmds
add-zsh-hook precmd get_retval

# Colors
reset_color="%{[00m%}"
prompt_color_name="%{[38;5;001m%}"
prompt_color_git="%{[38;5;004m%}"
prompt_color_pwd="%{[38;5;007m%}"
prompt_color_time="%{[38;5;007m%}"
prompt_color_false="%{[38;5;001m%}"

# OMZ settings
ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=' '

# Prompt
PROMPT=''
PROMPT+='${prompt_color_name}%n${reset_color} '
PROMPT+='${prompt_color_time}[%*]${reset_color} '
PROMPT+='${prompt_color_pwd}$(trunc_pwd)${reset_color} '
PROMPT+='${prompt_color_git}$(trunc_git_branch)${reset_color}'
PROMPT+='${prompt_color_false}$(exit_symbol)${reset_color}'
PROMPT+='λ '

# Right-side prompt
# RPROMPT=''
# RPROMPT+='${prompt_color_false}$(exit_symbol)${reset_color}'
# RPROMPT+='${prompt_color_time}%*${reset_color}'
