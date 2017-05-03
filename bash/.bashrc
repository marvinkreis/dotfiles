#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export HISTFILE=$HOME/temp/.bash_history
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
