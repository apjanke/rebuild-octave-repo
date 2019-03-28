#!/bin/bash
#
# bisect-push
#
# Attempts to figure out the bad change set by doing a binary search
# through the change history of the octave repo.
#
# This will need to be written to store its state - highest good cs,
# lowest bad cs - while doing the search, because we'll need to do it
# off and on due to Bitbucket's push throttling.