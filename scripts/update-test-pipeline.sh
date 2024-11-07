#!/usr/bin/env bash

set -eu

echo "Setting test pipeline..."

fly -t ci sp -p test-pipeline \
  -c  ./pipelines/test.yml \
  --check-creds
