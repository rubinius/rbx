#!/usr/bin/env bash

function build2_config_dir {
  echo "../.build2/configs"
}

function build2_release_name {
  echo "$(build2_config_dir)/$1-release"
}
