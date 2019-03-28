#!/bin/bash
#
# This exports the entire history of the octave repo as single-changeset
# patch files. It's used to populate the changeset-exports directory.
#
# Issue: This only gets changesets on the main branch. Are there other branches
# that we need to export?

changesets=($(cat changesets | sort -n))

for cs in "${changesets[@]}"; do
	cs_file="changeset-exports/${cs}.patch"
	if [[ ! -f "$cs_file" ]]; then
		hg -R octave export $cs > "$cs_file"
	fi
done

echo "all changesets exported"
