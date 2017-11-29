#!/bin/bash

touch ~/.git-author

git config --global commit.template ~/.git-author

cat >> ~/.bash_profile <<EOL

# disable --signoff called by 'git-together commit'
export GIT_TOGETHER_NO_SIGNOFF=1
EOL
