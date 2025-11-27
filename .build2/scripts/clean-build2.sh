#!/bin/bash

function clean_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Cleans "project-name".
EOM
  exit 1
}

if [[ -z "$1" ]]; then
  clean_build2_usage
fi

echo "Cleaning $1"

