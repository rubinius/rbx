#!/bin/bash

function test_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Tests "project-name".
EOM
  exit 1
}

if [[ -z "$1" ]]; then
  test_build2_usage
fi

echo "Testing $1"

b test
