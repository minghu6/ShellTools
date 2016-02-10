#!/bin/bash

#watchdir.sh

#watch the directory access

watchdir(){
    path=$1
    inotifywait -m -r -e create,move,delete $path -q
}

help(){
    echo 'need inotify-tools'
    echo '    -h for help'
    echo 'usage:'
    echo '    watchdir path'
}

if [ $1 != '-h' ] && [ $# -eq 1 ]
then
    echo $@;
    watchdir $@;
else
    help;
fi
