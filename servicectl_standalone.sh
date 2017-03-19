#!/bin/bash

CONTAINER_NAME="elasticsearch-5.2.2"

function usage {
    "Usage: ${0##*/} {start|stop|restart}"
}

function start {
    docker run --name $CONTAINER_NAME \
        -it \
        -e "TZ=Asia/Seoul" \
        elasticsearch:5.2.2
}

function stop {
    docker stop $CONTAINER_NAME
    docker rm $CONTAINER_NAME
}

if [ "$#" -ne 1 ]; then
    usage
    exit 1
fi

while [ "$#" -gt "0" ]
do
    case $1 in
        start)
            start
            ;;
        stop)
            stop
            ;;
        restart)
            stop
            start
            ;;
        *)
            usage
            exit 1
            ;;
    esac
    shift
done

