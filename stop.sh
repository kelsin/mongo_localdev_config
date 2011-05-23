#!/bin/bash

kill -15 $SWMONGO/pids/shard1-master.pid
kill -15 $SWMONGO/pids/shard1-slave1.pid
kill -15 $SWMONGO/pids/shard1-slave2.pid
kill -15 $SWMONGO/pids/shard2-master.pid
kill -15 $SWMONGO/pids/shard2-slave1.pid
kill -15 $SWMONGO/pids/shard2-slave2.pid
kill -15 $SWMONGO/pids/config.pid
kill -15 $SWMONGO/pids/router.pid
