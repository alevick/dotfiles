#!/bin/bash

brew install grep

GGREP=`which ggrep`
LINKED_GGREP=`echo $GGREP | sed 's/ggrep/grep/g'`
ln -fs $GGREP $LINKED_GGREP
