#!/bin/sh

set -x
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
wget https://raw.githubusercontent.com/openshift/openshift-docs/master/_topic_map.yml
cat _topic_map.yml | yq 'select(.Name=="Service Mesh").Topics[] | select (.Name == "Service Mesh 2.x").Topics' > topics.yml
rm _topic_map.yml
go run "${DIR}/tools/update-docs.go" --docsPath "${DIR}/topics/docs" --modulesPath "${DIR}"
