#!/bin/bash

#change char to Upper


path=`pwd`


if [ $# -ge "1" ];
then

    for file in "$@"
    do
        new_file=$path/${file}_UPPER;
        #echo $file;
        (cat $file | tr 'a-z' 'A-Z') > $new_file;
    done


else
    echo input your file which gonna to be Upper;
    read file;
    new_file=$path/$file
    (cat $file | tr 'a-z' 'A-Z') > $new_file;
fi
