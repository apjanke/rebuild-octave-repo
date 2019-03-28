rebuild-octave-repo
===================

There's something wrong with the Octave hg repo as of March 2019. When I clone it and try to push it to another remote repo (e.g. on Bitbucket), the push fails.

```
[octave-clone-attempt] $ hg --version | head -1
Mercurial Distributed SCM (version 4.9.1)
[octave-clone-attempt] $ hg clone https://hg.savannah.gnu.org/hgweb/octave
destination directory: octave
requesting all changes
adding changesets
adding manifests
adding file changes
added 26997 changesets with 176233 changes to 14061 files
new changesets 22412e3a4641:5bd4ffb55b1b
updating to bookmark @
cloning subrepo gnulib from http://hg.octave.org/gnulib
real URL is https://hg.octave.org/gnulib
requesting all changes
adding changesets
adding manifests
adding file changes
added 40247 changesets with 134453 changes to 11589 files (+34 heads)
new changesets cb836a3f733e:c34f677e6117
3331 files updated, 0 files merged, 0 files removed, 0 files unresolved
[octave-clone-attempt] $ cd octave
[octave] $ hg config --local
[octave] $ cat .hg/hgrc
[paths]
default = https://hg.savannah.gnu.org/hgweb/octave
bitbucket = ssh://hg@bitbucket.org/apjanke/octave-fresh-01
[octave] $ hg push bitbucket
pushing to ssh://hg@bitbucket.org/apjanke/octave-fresh-01
no changes made to subrepo gnulib since last push to http://hg.octave.org/gnulib
searching for changes
remote: adding changesets
remote: adding manifests
remote: adding file changes
remote: transaction abort!
remote: rollback completed
remote: received spurious file revlog entry
abort: push failed on remote
[octave] $
```

I talked to Bitbucket support and they say it's an issue with the repo's history; Hg doesn't like something about it, and it fails during the validation stage used in remote pushes.

Hg agrees: `hg verify` fails on the repo.

```
$ hg verify
checking changesets
checking manifests
crosschecking files in changesets and manifests
checking files
checked 26998 changesets with 176234 changes to 13915 files
checking subrepo links
.hgsubstate is corrupt in revision ecf0c6bca0c9
.hgsubstate is corrupt in revision e0fb702a62a4
.hgsubstate is corrupt in revision 1398901839b6
[...]
21820: repository /Users/janke/local/repos/octave/gnulib-hg not found
21834: repository /Users/janke/local/repos/octave/gnulib-hg not found
$
```

See http://lists.gnu.org/archive/html/octave-maintainers/2018-07/msg00177.html

This repo contains code and stuff I'm using to try and work the situation.

## What's in this repo

* `.` - scripts for working with the problem
* `changeset-exports` - the entire `octave` repo history as single changeset patches, created with `hg export -r`

### Stuff you should add

Create `octave/` with `hg clone https://www.octave.org/hg/octave`.

## Author

[Andrew Janke](https://apjanke.net), March 2019

