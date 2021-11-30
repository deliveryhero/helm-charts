#!/bin/sh

set -eu

rm -rf .stable

ALL_CHARTS=$(ls stable)

# Create a copy of each README.md files before running helm-docs
for chart in $ALL_CHARTS; do
  mkdir -p ".stable/$chart"
  cp "stable/$chart/README.md" ".stable/$chart/README.md"
done

# Run helm-docs to generate all README.md files from the template
helm-docs --log-level warning --template-files ./ci/README.md.gotmpl

# Check all README.md files for changes after running helm-docs
set +e
for chart in $ALL_CHARTS; do
  echo "Checking stable/$chart/README.md..."
  diff -s "stable/$chart/README.md" ".stable/$chart/README.md" > /dev/null
  if [ $? -eq 1 ]; then
    echo "🔴 Error: file stable/$chart/README.md needs to be updated: "
    diff "stable/$chart/README.md" ".stable/$chart/README.md"
    echo "See main repo README.md for instructions"
    rm -rf .stable
    exit 1
  fi
done

rm -rf .stable

echo "✅ All chart README.md files are up to date"

exit 0
