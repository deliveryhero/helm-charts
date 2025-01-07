#!/bin/bash

set -euo pipefail

while IFS= read -r -d '' chart
do
  echo "=============================================================="
  echo "helm-conftest running for chart: ${chart}..."

  # Remove any dependencies as we are not going to test them
  rm -f "${chart}/requirements.yaml"
  rm -rf "${chart}/charts"
  yq -i 'del(.dependencies)' "${chart}/Chart.yaml"

  helm template "${chart}" | conftest -p ci/helm-conftest-policies test -
done < <(find stable -maxdepth 1 -mindepth 1 -print0)
