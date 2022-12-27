#!/bin/sh bash

read -p "Enter URL to the github repo: " $REPO

mkdir ~/configs/
alias configs='/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME'
configs clone --bare $REPO ~/configs/
configs checkout
configs config --local status.showUntrackedFiles no
configs push --set-upstream origin master
