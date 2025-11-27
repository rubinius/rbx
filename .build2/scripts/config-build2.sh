#!/bin/bash

function config_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Configures "project-name" for build2.
EOM
  exit 1
}

if [[ -z "$1" ]]; then
  config_build2_usage
fi

echo "Configuring build2 for $1"

function config_check {
  bdep status @release > /dev/null 2>&1
}

if ! config_check; then
  bdep init -C "../.build2/configs/$1-release" \
    @release \
    cc config.cxx=clang++
fi
