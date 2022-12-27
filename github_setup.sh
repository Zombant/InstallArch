#!/bin/bash

read -p "Enter your email: " EMAIL

ssh-keygen -t ed25519 -C $EMAIL
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

echo "Now create a new SSH key on github and copy the contents of \"~/.ssh/id_ed25519.pub\""
