#!/bin/bash

set -eux

dir=$( cd $(dirname $0) ; pwd -P )

find $dir/files -type f | 
while read dot_file; do
    local_file=~/.`basename $dot_file`
    echo Linking $local_file to $dot_file
    ln -sf $dot_file $local_file
done

ln -sf ~/dot_files/vim ~/.vim

user=`users | head -n1`
mkdir -p ~/.config && sudo chown -R $user:admin ~/.config && sudo pip install flake8 && sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && sudo chown -R $user:admin ~/.vim && sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && cd ~/.vim/bundle/ && rm -rf vim-flake8 && git clone https://github.com/nvie/vim-flake8
