#!/usr/bin/env sh

cat /var/version && echo ""
set -eux

if [ -n "${CF_ENVIRONMENT_VARIABLES_FILE}" ]; then
  set +x
  # shellcheck disable=SC1090
  . "${CF_ENVIRONMENT_VARIABLES_FILE}"
  set -x
fi

cf_skip_ssl_validation=""
# shellcheck disable=SC2153
if [ "${CF_SKIP_SSL_VALIDATION}" = "true" ]; then
  cf_skip_ssl_validation="--skip-ssl-validation"
fi

cf api "${CF_API_URL}" ${cf_skip_ssl_validation}
cf auth
cf target -o "${CF_ORG}" -s "${CF_SPACE}"
# shellcheck disable=SC2086
cf ${CF_COMMAND}
