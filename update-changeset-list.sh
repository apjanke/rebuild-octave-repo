#!/bin/bash
#
# Updates the changeset list

cd octave

branches=($(hg branches | sed -n -E -e 's/^([a-zA-Z0-9\-]*) +[0-9].*/\1/p'))

for branch in "${branches[@]}"; do
	echo "getting changesets from branch: ${branch}"
	hg update $branch
	hg log | grep '^changeset:' | sed -n -E -e 's/^changeset: *(.*):.*/\1/p' > ../changesets.tmp
done

cd ..

cat changesets.tmp | sort -n | uniq > changesets
rm changesets.tmp

