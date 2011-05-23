#!/bin/bash

if [ -z "$MONGO" ]; then
    echo "Need to set MONGO to point to your mongo directory"
    exit 1
fi

kill -15 `cat $MONGO/pids/shard1-master.pid`
kill -15 `cat $MONGO/pids/shard1-slave1.pid`
kill -15 `cat $MONGO/pids/shard1-slave2.pid`
kill -15 `cat $MONGO/pids/shard2-master.pid`
kill -15 `cat $MONGO/pids/shard2-slave1.pid`
kill -15 `cat $MONGO/pids/shard2-slave2.pid`
kill -15 `cat $MONGO/pids/config.pid`
kill -15 `cat $MONGO/pids/router.pid`
