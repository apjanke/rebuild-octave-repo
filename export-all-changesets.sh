#!/bin/bash

IFS=$'\r\n' GLOBIGNORE='*' command eval  'changesets=($(cat original-hg-changesets | sort -n))'

for cs in "${changesets[@]}"; do
	hg -R octave export $cs > changeset-exports/${cs}.patch
done

echo "all changesets exported"
