#!/bin/bash

DIR=$(cd "$(dirname $0)" && pwd)

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

$DIR/install_pathogen_flake8.sh
#$DIR/install_ycm.sh
