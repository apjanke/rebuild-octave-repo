#!/bin/bash
#
# Incrementally pushes the octave repo history to its remote, so we
# can figure out which individual changeset is getting rejected (if that's
# the issue)

IFS=$'\r\n' GLOBIGNORE='*' command eval  'changesets=($(cat original-hg-changesets | sort -n))'

for cs in "${changesets[@]}"; do
	echo "Pushing changeset $cs"
	hg -R octave push -r $cs bitbucket-ssh
	if [[ $? == 0 ]]; then
		echo OK
	else
		echo FAILURE
		exit 1
	fi
done
