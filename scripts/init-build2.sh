#!/usr/bin/env bash

echo "Initializing .build2"
git subtree add \
  --prefix=.build2 \
  git@github.com:rubinius/.build2.git \
  main --squash
