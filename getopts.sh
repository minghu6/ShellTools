#!/bin/bash

#only obey short args (single char)
while getopts "p:f:ht" arg
do
    case $arg in
        p)
            echo "path: $OPTARG"
            ;;
        f)
            echo "file: $OPTARG"
            ;;
        h)
            echo "h"
            ;;
        t)
            echo "t"
            ;;
        ?)
        echo "??"
        ;;
    esac
done

echo $1
