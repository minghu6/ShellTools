#!/bin/bash

#count any form file's total raw number
echo "input your file's format in \(*.sh\)"

read format

echo input your path \(default .\)

read path

if [ $path -eq ''];
then

    path=.
fi
#echo $format
find $path -type f -name "$format" -print0 | xargs -0 wc -l
