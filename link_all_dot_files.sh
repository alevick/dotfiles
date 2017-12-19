#!/bin/bash

set -eu

dir=$( cd $(dirname $0) ; pwd -P )

find $dir/files -type f | 
while read dot_file; do
    local_file=~/.`basename $dot_file`
    echo Linking $local_file to $dot_file
    ln -sf $dot_file $local_file
done
