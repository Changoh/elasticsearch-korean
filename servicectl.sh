#!/bin/bash

CONTAINER_NAME="elasticsearch-example"

function usage {
    "Usage: ${0##*/} {start|stop|restart}"
}

function start {
    docker run --name $CONTAINER_NAME \
        -it \
        -e "TZ=Asia/Seoul" \
	-e ES_JAVA_OPTS="-Xms1g -Xmx1g" \
        -p 9333:9333 \
        -p 9222:9222 \
        -v $ES_HOME/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro \
        -v $ES_HOME/data:/usr/share/elasticsearch/data \
        -v $ES_HOME/log:/var/log/elasticsearch \
	elasticsearch:korean-test
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

