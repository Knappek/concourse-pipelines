#!/usr/bin/env bash

set -eu

echo "Setting sandbox foundation pipeline..."

fly -t ci sp -p deploy-sandbox-foundation \
  -c  ./pipelines/deploy-foundation.yml \
  --var foundation=sandbox \
  --load-vars-from=./foundations/sandbox/vars/tas.yml \
  --load-vars-from=./foundations/sandbox/vars/isolation-segment.yml \
  --load-vars-from=./foundations/sandbox/vars/isolation-segment-bank.yml \
  --check-creds
