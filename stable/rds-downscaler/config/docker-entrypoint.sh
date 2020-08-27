#!/bin/sh

set -eu

pip3 install --user boto3

exec "$@"
