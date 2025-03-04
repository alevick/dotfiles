#!/bin/bash

# GNU Grep
brew install grep

GGREP=`which ggrep`
LINKED_GGREP=`echo $GGREP | sed 's/ggrep/grep/g'`
ln -fs $GGREP $LINKED_GGREP

# GNU cut
# Provides things like the --complement flag
brew install coreutils
GCUT=`which gcut`
ln -fs $GCUT $(echo $GCUT | sed 's/gcut/cut/g')
