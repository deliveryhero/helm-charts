#!/bin/sh

if [[ ! -z "${GITHUB_RUN_ID}" ]]; then
  alias conftest=/root/.helm/plugins/helm-conftest/bin/conftest
  helm repo remove local
  set -euo pipefail
fi

for chart in $(find stable -maxdepth 1 -mindepth 1); do
  echo "=============================================================="
  echo "helm-conftest running for chart: ${chart}..."
  # Remove any dependencies as we are not going to test them
  rm -f "${chart}/requirements.yaml"
  rm -rf "${chart}/charts"
  helm template "${chart}" | conftest -p ci/helm-conftest-policies test -
done
