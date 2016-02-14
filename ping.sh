#!/bin/bash

#filename: ping.sh
#using: check if the ip is alive

for ip in 192.168.0.{1..255};
do
    (
        ping $ip -c 2 &>/dev/null;
        if [[ $? -eq 0 ]];
        then
            echo $ip is alive
        fi

    )&
    #& in background
done

wait
