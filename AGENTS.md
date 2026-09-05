# AGENTS.md

Multi-arch base image: Ubuntu + [tini](https://github.com/krallin/tini) as entrypoint (`tini --`).

## Commands

```bash
just build                                  # build jahrik/arm-tini:latest
docker run --rm jahrik/arm-tini:latest ps -p 1 -o comm=   # tini
```

## CI

`build.yml`: Test (build + PID 1 = tini check) on PR; Release (buildx amd64/arm64/armv7 push to Docker Hub) on merge to main. Needs `DOCKERHUB_USERNAME`/`DOCKERHUB_TOKEN` secrets. Both jobs install `just` and run the `justfile`'s recipes (`build`, `login`, `release`) instead of raw `docker`/`docker/*-action` steps.

## Quirks

- tini comes from Ubuntu's apt repo (unpinned; hadolint DL3008 ignored on purpose) — the old gpg-verified GitHub-release download is gone.
- Base-image repo: no compose, no swarm stack. arm-gosu-tini used to chain off this image but now installs tini itself.
