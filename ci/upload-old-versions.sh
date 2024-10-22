#!/bin/bash

CHARTS=$(ls -1 stable/)

while true; do
  for chart in $CHARTS; do
    if [ ! -d "stable/$chart" ]; then
      echo "skipping stable/$chart, does not exist"
      continue
    fi
    chart_env_name=$(echo $chart | sed 's/-/_/g')
    current_version=$(yq '.version' stable/$chart/Chart.yaml)
    previous_version_env_name=$chart_env_name
    previous_version=${!previous_version_env_name}
    if [[ "$current_version" == "$previous_version" ]]; then
      continue
    fi
    echo "Building and pushing $chart $current_version"
    helm dep up "stable/$chart"
    helm package "stable/$chart" -u
    package_file=$(ls "$chart"*.tgz)
    helm push $package_file oci://ghcr.io/deliveryhero/helm-charts
    export $(echo "$(echo ${chart_env_name})=$current_version")
    rm -f $package_file
  done
  previous_commit=$(git log --oneline | head -2 | tail -1 | cut -f1 -d' ')
  echo "Moving to previous commit: $previous_commit ..."
  git reset --hard $previous_commit --quiet
  echo "=================================================================================="
done
