#!/bin/bash

# This script takes the $(username)@$(ip) as the first argument and the pem file as the second argument.
# 
# Alternatively, if you use .ssh/config to make sshing around easier,
# you can just give the name you use in that file.

target=$1
pem=$2

echo "PEM IS $pem"

# Don't need this cause shit is simlinked now
#cp ~/.bashrc ~/.tmux.conf ~/.vimrc ~/dot_files

if [ -z $target ]; then
    echo 'Need to supply ip as first argument'
    exit 666
fi

if [ -n "$pem" ]; then
    echo 'setting pem'
    pem="-i $pem"
fi

local_files=~/dot_files/files
files=`ls -a $local_files | tail -n+3 | tr '\n' ' '`
ssh $pem $target "rm $files"
echo $files
echo Copying $files to $target using key file $pem

for fn in $files; do
    file=$local_files/$fn
    echo $file $target:$fn
    scp $pem $file $target:$fn
done
ssh $pem $target 'sudo -u ubuntu mkdir -p ~/.config && sudo chown ubuntu:ubuntu -R ~/.config && sudo pip install flake8 && sudo mkdir -p ~/.vim/autoload ~/.vim/bundle && sudo chown -R ubuntu:ubuntu ~/.vim && sudo curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && cd ~/.vim/bundle/ && rm -rf vim-flake8 && git clone https://github.com/nvie/vim-flake8'
ssh $pem $target "if ! grep 'AcceptEnv .*AWS' /etc/ssh/sshd_config >/dev/null; then sudo sed -i 's/AcceptEnv /AcceptEnv AWS_* GIT_*/' /etc/ssh/sshd_config; fi"
scp $pem ~/dot_files/flake8 $target:~/.config/flake8 #Copy .vim dir with flake8 settings etc
