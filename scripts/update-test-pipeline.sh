#!/usr/bin/env bash

set -eu

echo "Setting test pipeline..."

$GOPATH/bin/fly -t ci sp -p test-pipeline \
  -c  ./pipelines/test.yml \
  --var foundation=sandbox \
  --check-creds
