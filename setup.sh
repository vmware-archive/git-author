#!/bin/bash
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

GIT_AUTHOR_FILE_NAME=${HOME}/.git-author-template

# create an empty template if it doesn't exist
touch ${GIT_AUTHOR_FILE_NAME}

# config git to use a commit template
git config --global commit.template ${GIT_AUTHOR_FILE_NAME}

# put git-author to search path, so that `git author` works.
cp ${SCRIPT_DIR}/git-author /usr/local/bin
