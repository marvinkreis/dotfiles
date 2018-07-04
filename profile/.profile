export EDITOR=vim
export PAGER=less
export XDG_CONFIG_HOME=${HOME}/.config

if [ -f ~/.profile+ ]; then
    source ~/.profile+
fi
