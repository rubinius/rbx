#!/usr/bin/env bash

__dir__="$(cd "$(dirname "$0")" && pwd)"

# shellcheck source=scripts/common.sh
source "$__dir__/common.sh"

function config_build2_usage {
  cat >&2 <<-EOM
Usage: ${0##*/} project-name

  Configures "project-name" for build2.
EOM
  exit 1
}

if [[ $# -lt 1 ]]; then
  config_build2_usage
fi

project="$1"

echo "Configuring build2 for $project"

function build2_config_check {
  bdep status @release > /dev/null 2>&1
}

if ! build2_config_check; then
  bdep init --wipe -C "$(build2_release_name "$project")" \
    @release \
    cc config.cxx=clang++
fi
