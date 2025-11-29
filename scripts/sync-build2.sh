#!/usr/bin/env bash

echo "Syncing .build2"
git subtree pull --prefix=.build2 \
  git@github.com:rubinius/.build2.git \
  main --squash
