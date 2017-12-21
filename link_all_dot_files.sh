#!/bin/bash

set -eu

dir=$( cd $(dirname $0) ; pwd -P )

find $dir/files -type f | 
while read dot_file; do
    local_file=~/.`basename $dot_file`
    if [[ "$dot_file" = *"bashrc_local"* ]]; then
        echo Copying $local_file to $dot_file
        rm $local_file
        cp $dot_file $local_file
    else
        echo Linking $local_file to $dot_file
        ln -sf $dot_file $local_file
    fi
done

touch ~/.vimrc_local
