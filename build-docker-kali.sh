#!/usr/bin/env bash

tag="$(date '+%Y-%m-%d')"

echo "Build tag is:  ${tag}"

#docker build --squash \
docker build \
  -f Dockerfile \
  -t "quay.io/freedomben/kali:${tag}" \
  -t "quay.io/freedomben/kali:latest" \
  -t "docker.io/freedomben/kali:${tag}" \
  -t "docker.io/freedomben/kali:latest" \
  .

