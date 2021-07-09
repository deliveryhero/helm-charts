#!/bin/bash

set -euo pipefail

# Check if we are running in docker and ensure we have Helm3 if so
if [ -f "/.dockerenv" ]; then
  CONFTEST="/root/.helm/plugins/helm-conftest/bin/conftest"
  if helm version --client --short | grep -q 'v2.14'; then
    echo "Running in docker but Helm version 2 found, will install Helm 3..."
    export VERIFY_CHECKSUM=false
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
    chmod 700 get_helm.sh
    ./get_helm.sh --version "v3.6.2"
    rm -f /usr/bin/helm
    alias helm="/usr/local/bin/helm"
    echo "Helm version now installed: "
    helm version
  fi
else
  CONFTEST=$(which conftest)
fi

for chart in $(find stable -maxdepth 1 -mindepth 1); do
  echo "=============================================================="
  echo "helm-conftest running for chart: ${chart}..."
  # Remove any dependencies as we are not going to test them
  rm -f "${chart}/requirements.yaml"
  rm -rf "${chart}/charts"
  helm template "${chart}" | $CONFTEST -p ci/helm-conftest-policies test -
done
