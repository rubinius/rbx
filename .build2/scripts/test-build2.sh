#!/usr/bin/env bash

function test_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Tests "project-name".
EOM
  exit 1
}

if [[ $# -lt 1 ]]; then
  test_build2_usage
fi

project="$1"

echo "Testing $project"
b test
