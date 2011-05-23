#!/bin/bash

echo "* Starting mongo servers"
mongod --replSet shard1 --port 27021 --shardsvr --master --dbpath $SWMONGO/shard1/master --logpath $SWMONGO/logs/shard1-master.log --logappend
mongod --replSet shard1 --port 27022 --shardsvr --slave  --dbpath $SWMONGO/shard1/slave1 --logpath $SWMONGO/logs/shard1-slave1.log --logappend --source localhost:27021
mongod --replSet shard1 --port 27023 --shardsvr --slave  --dbpath $SWMONGO/shard1/slave2 --logpath $SWMONGO/logs/shard1-slave2.log --logappend --source localhost:27021
mongod --replSet shard2 --port 27024 --shardsvr --master --dbpath $SWMONGO/shard2/master --logpath $SWMONGO/logs/shard2-master.log --logappend 
mongod --replSet shard2 --port 27025 --shardsvr --slave  --dbpath $SWMONGO/shard2/slave1 --logpath $SWMONGO/logs/shard2-slave1.log --logappend --source localhost:27024
mongod --replSet shard2 --port 27026 --shardsvr --slave  --dbpath $SWMONGO/shard2/slave2 --logpath $SWMONGO/logs/shard2-slave2.log --logappend --source localhost:27024

echo "* Starting config server"
mongod --configsvr --port 27019 --dbpath $SWMONGO/config --logpath $SWMONGO/logs/config.log --logappend

echo "- Waiting for config server to start ..."
sleep 5

echo "* Starting router"
mongos --port 27017 --configdb localhost:27019 --chunksize 1 --logpath $SWMONGO/logs/router.log --logappend

