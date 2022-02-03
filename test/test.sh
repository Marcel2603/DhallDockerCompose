#!/bin/bash
expected_compose="docker-compose-expected.yaml"
actual_compose="docker-compose-actual.yaml"
dhall_test="../example/create_docker_compose.dhall"

set -e

if [[ "$(pwd)" != **/test ]]; then (echo "Script was not executed from /test" && exit 1); fi

echo "Creating compose.yaml"
dhall-to-yaml-ng --file $dhall_test --output $actual_compose
echo "Validate compose.yaml"
docker-compose --ansi=never -f $actual_compose config -q || (echo "compose invalid" && exit 2)
cmp $expected_compose $actual_compose || (echo "generated Files is different" && exit 2)
echo "all fine"
set +e
rm $actual_compose
