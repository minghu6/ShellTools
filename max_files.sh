#!/bin/bash

#find max size of files

find_files(){
    # $1:path $2:n $3:k/m

    if [[$1='']]
    then
        path=.;
    else
        path=$1;
    fi

    if [ $2 -eq '']
    then
        n='10';
    else
        n=$2
    fi

    if [ $3 -eq '']
    then
        size='k';
    else
        size=$3
    fi

    printf "\n${size}b\n\n";
    find $path -type f -exec du -$size {} \;| sort -nrk 1 | head -n $n
}


if [ $# -eq 0 ]
then
    echo "input path(default . )"
    read path
    if [$path -eq '']
    then

        path=$(pwd);
        echo $path
    fi

    echo "input max file\'s  number (default 10)"
    read n
    if [ $n -eq '']
    then
        n='10';
    fi

    echo "input size (defalut k)"
    read size

    if [ $size -eq '']
    then
        size='k';
    fi

    find_files $path $n $size

else
    find_files $@
fi
