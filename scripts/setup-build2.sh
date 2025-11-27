#!/bin/bash

function setup_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Sets up "project-name" for build2.
EOM
  exit 1
}

if [[ -z "$1" ]]; then
  setup_build2_usage
fi

echo "Setting up build2 for $1"


