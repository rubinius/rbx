#!/usr/bin/env bash

__dir__="$(cd "$(dirname "$0")" && pwd)"

# shellcheck source=scripts/common.sh
source "$__dir__/common.sh"

function clean_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Cleans "project-name".
EOM
  exit 1
}

if [[ $# -lt 1 ]]; then
  project_labels_usage
fi

project="$1"

echo "Cleaning $2"
rm -rf "$(build2_release_name "$project")"
