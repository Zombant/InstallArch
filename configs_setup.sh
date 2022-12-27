#!/bin/sh bash

if [ -z "$1" ]
    echo "Error: give a url to a github repo"
    exit 1
fi

mkdir ~/configs/
alias configs='/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME'
configs clone --bare $1 ~/configs/
configs checkout
configs config --local status.showUntrackedFiles no
configs push --set-upstream origin master
