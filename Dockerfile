FROM docker.io/library/ubuntu:24.04

LABEL org.opencontainers.image.authors="jahrik@gmail.com"

# tini as init: signal processing and zombie reaping
# hadolint ignore=DL3008
RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends tini; \
	rm -rf /var/lib/apt/lists/*; \
# verify that the binary works
	tini -- true

ENTRYPOINT ["tini", "--"]
