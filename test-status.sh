#!/bin/bash

CMD="ls -al"
$CMD
if [ $? -eq 0 ]
then
    echo "$CMD executed successful"

else
    echo "$CMD terminated unseccessful"
fi
