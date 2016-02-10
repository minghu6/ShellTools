#!/bin/bash

#filename pcpu_usage.sh
#count cpu suage

pcpu_usage(){
    SESC=$1
    UNIT_TIME=$2

    STEPS=$(($SESC/$UNIT_TIME))

    echo Watching CPU usage...;

    for((i=0;i<STEPS;++i))
    do
        ps -eocomm,pcpu | tail -n +2 >> /tmp/cpu_usage.$$;
        sleep $UNIT_TIME;
    done

    echo
    echo CPU eaters;


    cat /tmp/cpu_usage.$$ | \
        awk '
{ process[$1]+=$2;}
END{
  for(i in process){
     printf("%-20s %s\n",i,process[i]);
  }

}' | sort -nrk 2 | head;

    rm /tmp/cpu_usage.$$;
}

help(){
    echo '    -h for help'
    echo '    -t for total listen time(second)'
    echo '    -p for interval time for listening process(second)'
    echo 'such as: '
    echo '    pcpu_usage -t 3600 -p 60 '
    echo 'means that listen an hour per minute(default)'
}

time=3600
per=60

while getopts "t:p:h" arg
do
    case $arg in
        h)
            help
            ;;
        t)
            time=$OPTARG
            ;;
        p)
            per=$OPTARG
            ;;
        ?)
        help
        ;;
    esac
done


pcpu_usage $time $per
