#!/usr/bin/env bash

set -eu

echo "Setting download products pipeline..."

fly -t ci sp -p download-products \
  -c ./pipelines/download-products.yml \
  --check-creds

