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

if [ -n "${CF_COMMAND}" ]; then
  # shellcheck disable=SC2086
  ${CF_COMMAND}
fi

if [ -n "${CF_COMMAND_FILE}" ]; then
  # shellcheck disable=SC2086
  chmod +x ${CF_COMMAND_FILE}
  # shellcheck disable=SC2086
  ./cf-command-file/${CF_COMMAND_FILE} ${CF_COMMAND_FILE_INPUT_PARAMETERS}
fi
