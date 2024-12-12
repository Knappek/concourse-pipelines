#!/usr/bin/env bash

cat /var/version && echo ""
set -eux

touch custom-credentials/creds.yml
for credential in ${CREDENTIAL_FIELD_TO_ENV_NAME_MAPPINGS}; do
  field=$(echo "${credential}" | cut -d":" -f1)
  env_name=$(echo "${credential}" | cut -d":" -f2)
  echo "export ${env_name}=$(om --env env/${ENV_FILE} credentials \
    -p ${PRODUCT} \
    -c ${CREDENTIAL_REFERENCE} \
    -f ${field})" >> custom-credentials/creds.yml
done
