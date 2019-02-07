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
