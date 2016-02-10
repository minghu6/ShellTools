#!/bin/bash

#repeat file
repeat()
{
    while true
    do
        echo hi;
        $@ && return;
        sleep 3;
    done
}
repeat $@
