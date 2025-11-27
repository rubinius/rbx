#!/bin/bash

function build_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Builds "project-name".
EOM
  exit 1
}

if [[ -z "$1" ]]; then
  build_build2_usage
fi

echo "Building $1"

b
