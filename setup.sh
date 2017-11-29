#!/bin/bash

# create an empty template if it doesn't exist
touch ~/.git-author

# config git to use a commit template
git config --global commit.template ~/.git-author

# put git-author to search path, so that `git author` works.
cp git-author /usr/local/bin
