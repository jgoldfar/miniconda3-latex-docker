#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DOCKER_REPO_BASE="miniconda3-latex"
IMG_TAG=full

#docker build -f Dockerfile.${IMG_TAG} -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}


IMG_TAG=minimal

docker build -f Dockerfile.${IMG_TAG} -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} .
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}
