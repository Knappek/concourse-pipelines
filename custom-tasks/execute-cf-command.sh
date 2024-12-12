#!/usr/bin/env bash

cat /var/version && echo ""
set -eux

login_options=""
for cfl in ${CF_LOGIN_OPTIONS}; do
  login_options+=("${cfl})")
done

if [ -n "${CF_ENVIRONMENT_VARIABLES_FILE}" ]; then
  # shellcheck disable=SC1090
  source "${CF_ENVIRONMENT_VARIABLES_FILE}"
fi

cf login -a "${CF_API_URL}" "${login_options[@]}" -s "${CF_SPACE}"
cf target -o "${CF_ORG}"
cf "${CF_COMMAND}"
