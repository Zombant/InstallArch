#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls -F -lh --color=auto'
alias lsa='ls -F -lha --color=auto'
PS1='[\u@\h \W]\$ '

doge