#!/usr/bin/env bash

function setup_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Sets up "project-name" for build2.
EOM
  exit 1
}

if [[ $# -lt 1 ]]; then
  setup_build2_usage
fi

project="$1"

echo "Setting up build2 for $project"


