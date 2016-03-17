function short_pwd {
    local pwd="${PWD/#$HOME/~}"
    if [[ "$pwd" == (#m)[/~] ]]; then
        _short_pwd="$MATCH"
    else
        _short_pwd="${${(@j:/:M)${(@s:/:)pwd}##.#?}:h}/${pwd:t}"
    fi
    echo $_short_pwd
}

PROMPT='$FG[001]%n%{$reset_color%} $FG[245]$(short_pwd)%{$reset_color%} $(git_prompt_info)%{$reset_color%}λ '
RPROMPT='%{$FG[242]%}%*%{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$FG[004]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
