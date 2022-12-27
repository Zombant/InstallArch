#!/bin/bash

read -p "Enter URL to the github repo: " $REPO

mkdir ~/configs/
/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME clone --bare $REPO ~/configs/
/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME checkout
/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME config --local status.showUntrackedFiles no
/usr/bin/git --git-dir=$HOME/configs/ --work-tree=$HOME config push --set-upstream origin master
