#!/bin/bash
#
# This exports the entire history of the octave repo as single-changeset
# patch files. It's used to populate the changeset-exports directory.
#
# Issue: This only gets changesets on the main branch. Are there other branches
# that we need to export?
#
# TODO: Should modify this to do incremental update for just changesets that
# have not already been exported.

IFS=$'\r\n' GLOBIGNORE='*' command eval  'changesets=($(cat original-hg-changesets | sort -n))'

for cs in "${changesets[@]}"; do
	hg -R octave export $cs > changeset-exports/${cs}.patch
done

echo "all changesets exported"
