#!/bin/bash

set -eu

DIR=`cd $(dirname $0) && pwd`

$DIR/link_all_dot_files.sh

if ! which pip > /dev/null ; then
    echo 'Installing homebrew...'
    echo  | /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if ! which pip > /dev/null ; then
    echo 'Do you want to install and setup pip/flake/pathogen?'
    read resp
    if [ "$resp" = 'y'* ]; then
        $DIR/get-pip.py
        $DIR/install_pathogen_flake8.sh
    fi
fi

if [[ ! -f ~/.git_email ]]; then
    echo 'What do you want your local git email to be?'
    read email
    echo $email > ~/.git_email
fi

$DIR/install_scm_breeze.sh
