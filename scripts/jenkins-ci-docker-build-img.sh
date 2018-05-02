#!/bin/bash -ex

./scripts/docker-add_registry-cred-helpers.py

./scripts/docker-delete-img-from-cache.sh
./scripts/docker-build-img.sh --no-cache --

if [[ "$PUBLISH_IMAGE_TO_DOCKER_REGISTRY" == "true" ]]
then
    ./scripts/docker-publish-img.sh
else
    echo "The image has *NOT* been pushed to the docker registry because PUBLISH_IMAGE_TO_DOCKER_REGISTRY=$PUBLISH_IMAGE_TO_DOCKER_REGISTRY." 
fi

./scripts/docker-delete-img-from-cache.sh

