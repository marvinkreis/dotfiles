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

reset_color="%{[00m%}"
prompt_color_name="%{[38;5;001m%}"
prompt_color_git="%{[38;5;004m%}"
prompt_color_pwd="%{[38;5;245m%}"
prompt_color_time="%{[38;5;242m%}"

PROMPT=""
PROMPT+='${prompt_color_name}%n${reset_color} '
PROMPT+='${prompt_color_pwd}$(short_pwd)${reset_color} '
PROMPT+='${prompt_color_git}$(git_prompt_info)${reset_color}'
PROMPT+='λ '

RPROMPT='${prompt_color_time}%*${reset_color}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
