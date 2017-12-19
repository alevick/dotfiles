#!/bin/bash

# This script takes the $(username)@$(ip) as the first argument and the pem file as the second argument.
# 
# Alternatively, if you use .ssh/config to make sshing around easier,
# you can just give the name you use in that file.

target=$1
pem=$2
DIR=`cd $(dirname $0) && pwd`

echo "PEM IS $pem"

if [ -z $target ]; then
    echo 'Need to supply ip as first argument'
    exit 666
fi

if [ -n "$pem" ]; then
    echo 'setting pem'
    pem="-i $pem"
fi

local_files=$DIR/files
files=`ls $local_files | tr '\n' ' '`
echo $files
echo Copying $files to $target using key file $pem

for fn in $files; do
    dot_fn=".$fn"
    echo $fn
    if [[ "$fn" != *"local"*  ]]; then
        file=$local_files/$fn
        echo $file $target:$dot_fn
        ssh $pem $target "rm $dot_fn"
        scp $pem $file $target:$dot_fn
    fi
done

scp $DIR/install_pathogen_flake8.sh $target:~/
ssh $pem $target 'python ~/install_pathogen_flake8.sh'
ssh $pem $target "if ! grep 'AcceptEnv .*AWS' /etc/ssh/sshd_config >/dev/null; then sudo sed -i 's/AcceptEnv /AcceptEnv AWS_* GIT_*/' /etc/ssh/sshd_config; fi"
scp $pem $DIR/flake8 $target:~/.config/flake8 #Copy .vim dir with flake8 settings etc
