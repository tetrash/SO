#!/usr/bin/env bash

for f in $(dirname "$0")/install/*.sh; do
  bash "$f" -H
done
