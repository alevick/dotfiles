#!/bin/bash

brew install gnu-grep

GGREP=`which ggrep`
LINKED_GGREP=`echo $GGREP | sed 's/ggrep/grep/g'`
ln -fs $GGREP $LINKED_GGREP
