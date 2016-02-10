#!/bin/bash

#change char to lower


path=`pwd`


if [ $# -ge "1" ];
then

    for file in "$@"
    do
        new_file=$path/${file}_lower;
        #echo $file;
        (cat $file | tr 'A-Z' 'a-z') > $new_file;
    done


else
    echo input your file which gonna to be lower;
    read file;
    new_file=$path/${file}_lower;
    (cat $file | tr 'A-Z' 'a-z') > $new_file;
fi
