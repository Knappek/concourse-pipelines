#!/usr/bin/env sh

domain=$1
if ! cf domains | awk '{print $1}' | grep -q -x "${domain}"; then
  echo "Creating domain ${domain}"
  cf create-shared-domain "${domain}"
fi
