#!/bin/sh

set -euo pipefail

alias conftest=/root/.helm/plugins/helm-conftest/bin/conftest
helm repo remove local

for chart in $(find stable -maxdepth 1 -mindepth 1); do
  echo -n "helm-conftest running for chart: ${chart}..."
  # Remove any dependencies as we are not going to test them
  rm -f "${chart}/requirements.yaml"
  helm template "${chart}" | conftest -p ci/helm-conftest-policies test - && echo "OK"
done
