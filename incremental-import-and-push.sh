#!/bin/bash
#
#

repo = octave-tmp-$RANDOM
mkdir tmp-repos/$repo
repo_dir=tmp-repos/$repo
mkdir -p "$repo_dir"

IFS=$'\r\n' GLOBIGNORE='*' command eval  'changesets=($(cat original-hg-changesets | sort -n))'

for cs in "${changesets[@]}"; do
	echo "Importing changeset $cs"
	hg -R "$repo_dir" import changeset-exports/${cs}.patch
	echo "Pushing changeset $cs"
	hg -R "$repo_dir" push bitbucket-ssh
	if [[ $? == 0 ]]; then
		echo "OK"
	else
		echo "Failure: changeset $cs failed to push"
		exit 1
	fi
done
