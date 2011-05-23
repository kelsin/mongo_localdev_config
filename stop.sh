#!/bin/bash

if [ -z "$SWMONGO" ]; then
    echo "Need to set SWMONGO to point to your mongo directory"
    exit 1
fi

kill -15 `cat $SWMONGO/pids/shard1-master.pid`
kill -15 `cat $SWMONGO/pids/shard1-slave1.pid`
kill -15 `cat $SWMONGO/pids/shard1-slave2.pid`
kill -15 `cat $SWMONGO/pids/shard2-master.pid`
kill -15 `cat $SWMONGO/pids/shard2-slave1.pid`
kill -15 `cat $SWMONGO/pids/shard2-slave2.pid`
kill -15 `cat $SWMONGO/pids/config.pid`
kill -15 `cat $SWMONGO/pids/router.pid`
