#!/usr/bin/env bash

cat /var/version && echo ""
set -eux

for vfm in ${VAR_FILEPATH_MAPPING}; do
  key=$(echo "${vfm}" | cut -d":" -f1)
  filepath=$(echo "${vfm}" | cut -d":" -f2)
  flags+=("--var")
  flags+=("${key}=$(cat files/${filepath})")
done


mkdir -p interpolated-files
# ${flags[@] needs to be globbed to pass through properly
# shellcheck disable=SC2068
om interpolate --config "${CONFIG_PATH}" "${flags[@]}" > "${VARS_OUTPUT_PATH}/runtime-vars.yml"