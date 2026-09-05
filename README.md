# arm-tini

[![Build](https://github.com/jahrik/arm-tini/actions/workflows/build.yml/badge.svg)](https://github.com/jahrik/arm-tini/actions/workflows/build.yml)

Multi-arch Ubuntu base image with [tini](https://github.com/krallin/tini) as the entrypoint — proper signal handling and zombie reaping for whatever command you run.

## Run

```bash
docker run --rm jahrik/arm-tini:latest ps -p 1 -o user=,comm=
# root     tini
```

## Build

```bash
just build
just push
```

CI: PR builds + PID 1 check; merge to main pushes multi-arch (amd64/arm64/armv7) to Docker Hub.
