#!/bin/sh

set -eu

x86_64=${1:-no}
aarch64=${2:-no}
architectures=""

if [ "$x86_64" = yes ]; then
	architectures='"x86_64"'
fi

if [ "$aarch64" = yes ]; then
	if [ -n "$architectures" ]; then
		architectures="$architectures,"
	fi
	architectures="${architectures}\"aarch64\""
fi

if [ -z "$architectures" ]; then
	echo "No architecture selected" >&2
	exit 1
fi

printf '[%s]\n' "$architectures"
