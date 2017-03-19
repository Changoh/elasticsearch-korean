#!/bin/sh
#
# Docker 통해 ElasticSearch 관리하기 위한 스크립트.


CONTAINER_NAME="elasticsearch-5.2.2"

function usage {
    "Usage: ${0##*/} {start|stop|restart}"
}

function start {
    docker run --name $CONTAINER_NAME \
        -d \
        -e "TZ=Asia/Seoul" \
        -p 9333:9333 \
        -p 9222:9222 \
        -v /home/changoh/service/elasticsearch/config:/usr/share/elasticsearch/config:ro \
        -v /home/changoh/service/elasticsearch/data:/usr/share/elasticsearch/data \
        -v /home/changoh/service/elasticsearch/log:/var/log/elasticsearch \
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

