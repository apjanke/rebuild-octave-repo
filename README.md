rebuild-octave-repo
===================

There's something wrong with the Octave hg repo. When I clone it and try to push it to another remote repo (e.g. on Bitbucket), the push fails.

```
$ hg push bitbucket-ssh
pushing to ssh://hg@bitbucket.org/apjanke/octave
remote: Warning: Permanently added the RSA host key for IP address '18.205.93.1' to the list of known hosts.
no changes made to subrepo gnulib since last push to http://hg.octave.org/gnulib
searching for changes
remote: adding changesets
remote: adding manifests
remote: adding file changes
remote: transaction abort!
remote: rollback completed
remote: received spurious file revlog entry
```

I talked to Bitbucket support and they say it's an issue with the repo's history; Hg doesn't like something about it, and it fails during the validation stage used in remote pushes.

This repo contains code and stuff I'm using to try and work the situation.

## Author

[Andrew Janke](https://apjanke.net), March 2019

