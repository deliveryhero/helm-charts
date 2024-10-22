#!/bin/bash

CHARTS=$(ls -1 stable/)

count=0

while true; do
  echo "."
  for chart in $CHARTS; do
    chart_env_name=$(echo $chart | sed 's/-/_/g')
    current_version=$(yq '.version' stable/$chart/Chart.yaml)
    previous_version_env_name=$chart_env_name
    previous_version=${!previous_version_env_name}
    # echo "chart_env_name $chart_env_name current_version $current_version previous_version $previous_version"
    if [[ "$current_version" == "$previous_version" ]]; then
    # echo "skipping chart $chart, version $current_version is the same as previous ($previous_version)"
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
  count=$((count + 1))
  echo "=================================================================================="
  if [ "$count" -gt 10 ]; then
    echo "done"
    exit 0
  fi
done
