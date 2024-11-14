#!/bin/bash

# Run this script to push the artifacthub-repo.yml file to every helm chart OCI package
# This should only need to be run once for each packge

repo_root=$(git rev-parse --show-toplevel 2> /dev/null)

if [[ $? -ne 0 ]]; then
  echo "Error: Not in a Git repository." >&2
  exit 1
fi

if [[ ! -d "$repo_root" ]]; then
    echo "Error: Could not determine repository root." >&2
    exit 1
fi

if [[ "$(pwd)" != "$repo_root" ]]; then
  echo "Error: Not at the root of the deliveryhero/helm-charts repository. Current directory is $(pwd), but repo root is $repo_root" >&2
  exit 1
fi

if [[ ! -f "artifacthub-repo.yml" ]]; then
  echo "Error: artifacthub-repo.yml does not exist." >&2
  exit 1
fi

for chart in stable/*/; do
  chart_name=${chart%/}  # Remove the trailing /
  chart_name=${chart_name##*/} # Remove everything up to the last /

  echo "Processing chart: $chart_name"

  oras push \
    ghcr.io/deliveryhero/helm-charts/${chart_name}:artifacthub.io \
    --config /dev/null:application/vnd.cncf.artifacthub.config.v1+yaml \
    artifacthub-repo.yml:application/vnd.cncf.artifacthub.repository-metadata.layer.v1.yaml
done

exit 0
