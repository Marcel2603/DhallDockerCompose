#!/bin/bash
expected_compose="docker-compose-expected.yaml"
actual_compose="docker-compose-actual.yaml"
dhall_test="../example/create_docker_compose.dhall"

set -e

if [[ "$(pwd)" != **/test ]]; then (echo "Script was not executed from /test" && exit 1); fi

dhall-to-yaml-ng --file $dhall_test --output $actual_compose
docker-compose --ansi=never -f $actual_compose config || (echo "compose invalid" && exit $?)
cmp $expected_compose $actual_compose || (echo "generated Files is different" && exit 2)

set +e
rm $actual_compose
