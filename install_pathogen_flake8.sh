#!/bin/bash

DIR=`cd $(dirname $0) && pwd`

if [ ! -d ~/.vim ]; then
    ln -sf $DIR/vim ~/.vim
fi

user=`users | head -n1`
which pip && (mkdir -p ~/.config && sudo chown -R $user:admin ~/.config && sudo pip install flake8 && sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && sudo chown -R $user:admin ~/.vim && sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && cd ~/.vim/bundle/ && rm -rf vim-flake8 && git clone https://github.com/nvie/vim-flake8) || echo 'Pip not found. Not install pathogen'
