#!/usr/bin/env bash

function build_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Builds "project-name".
EOM
  exit 1
}

if [[ $# -lt 1 ]]; then
  build_build2_usage
fi

project="$1"

echo "Building $project"
b
