#!/bin/bash
set -e

if [ "${1#-}" != "$1" ]; then
	set -- tini "$@"
fi

# Run as user "tini" if the command is "tini"
# allow the container to be started with `--user`
if [ "$1" = 'tini' -a "$(id -u)" = '0' ]; then
	set -- tini -- "$@"
fi

exec "$@"
