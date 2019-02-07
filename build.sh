#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DOCKER_REPO_BASE="latex-julia-docker"
IMG_TAG=reqs-latest

docker build -f reqs/Dockerfile -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} reqs
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}


IMG_TAG=release-latest

docker build -f release/Dockerfile -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} release
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}


IMG_TAG=nightly-latest

docker build -f nightly/Dockerfile -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} nightly
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}


IMG_TAG=and-maxima-latest

docker build -f and-maxima/Dockerfile -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} and-maxima
docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}

# Use Docker Hub's infrastructure to build dev image
curl -X POST -L https://cloud.docker.com/api/build/v1/source/54b9fdcd-0dd1-4f42-b52e-555b73a2b897/trigger/5f52cd23-427c-483c-b7a5-e491d9f486ec/call/

#IMG_TAG=dev

#docker build -f dev/Dockerfile -t ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG} dev
#docker push ${DOCKER_USERNAME}/${DOCKER_REPO_BASE}:${IMG_TAG}
