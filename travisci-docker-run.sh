#!/bin/bash

export TRAVISCI_NAME="travisci-local"
# instance: "travis-job-f5b4d65a-4fc3-49c0-99a9-4ae694aa3383 travis-ci-sardonyx-xenial-1553530528-f909ac5 (via amqp)"
# docker pull travisci/ci-sardonyx:packer-1558623664-f909ac5
export TRAVISCI_INSTANCE="travisci/ci-sardonyx:packer-1558623664-f909ac5"
docker run --name $TRAVISCI_NAME -dit $TRAVISCI_INSTANCE /sbin/init
docker exec -it $TRAVISCI_NAME bash -l

