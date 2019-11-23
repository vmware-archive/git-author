#!/usr/bin/env bats

source "${BATS_TEST_DIRNAME}/git-author"

# helper functions
git-together-dependency() {
  echo "$@" >> /tmp/git-together-dependency-args
}

log() {
  echo "$@" >&3
}

# tests
setup() {
  rm -f /tmp/git-together-dependency-args
}

@test "using --global by default" {
  run git-author-main ab
  [ "${status}" -eq 0 ]

  run cat /tmp/git-together-dependency-args
  [ "${lines[0]}" = 'with --clear' ]
  [ "${lines[1]}" = 'with --global ab' ]
}

@test "not using --global if GIT_AUTHOR_LOCAL is defined" {
  GIT_AUTHOR_LOCAL=1 run git-author-main ab
  [ "${status}" -eq 0 ]

  run cat /tmp/git-together-dependency-args
  [ "${lines[0]}" = 'with --clear' ]
  [ "${lines[1]}" = 'with ab' ]
}
