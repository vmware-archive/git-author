#!/bin/bash

# create an empty template if it doesn't exist
touch ~/.git-author-template

# config git to use a commit template
git config --global commit.template ~/.git-author-template

# put git-author to search path, so that `git author` works.
cp git-author /usr/local/bin
