#!/bin/bash

#filename disklog.sh

#use listen disk usage on remote machine


logfile="/var/log/diskusage.log"

if [[ -n $1 ]]
then
    logfile=$1
fi

if [ ! -e $logfile ] #if-exist
then
    printf "%-8s %-14s %-9s %-8s %-6s %-6s %-6s %s\n" "Date" "IP address"\
           "Device" "Capacity" "Used" "Free" "Percent" "Status" > $logfile
fi

#remote ip list
IP_LIST="127.0.0.1 0.0.0.0"

(
    for IP in $IP_LIST;
    do
        #root username
        ssh root@$IP 'df -H' | grep ^/dev/ > /tmp/$$.df

        while read line;
        do
            cur_date=$(date +%D)
            printf "%-8s %-14s" $cur_date $ip

            echo $line | awk '{printf ("%-9s %-8s %-6s %-6s %-8s",\
            $1 $2 $3 $4 $5);}'

            pusg=$(echo $line | egrep -o "[0-9]+%")
            pusg=$(pusg/\%/);

            if [ $pusg -lt 80 ];
            then
                echo SAFE
            else
                echo ALERT
            fi

        done < /tmp/$$.df
    done
) >> $logfile
