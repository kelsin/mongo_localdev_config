#!/bin/bash

if [ -z "$MONGO" ]; then
    echo "Need to set MONGO to point to your mongo directory"
    exit 1
fi

echo "* Starting mongo servers"
mongod -vvv --rest --replSet shard1 --port 27021 --shardsvr --master --dbpath $MONGO/shard1/master --pidfilepath $MONGO/pids/shard1-master.pid --logpath $MONGO/logs/shard1-master.log --logappend &
mongod -vvv --rest --replSet shard1 --port 27022 --shardsvr --slave  --dbpath $MONGO/shard1/slave1 --pidfilepath $MONGO/pids/shard1-slave1.pid --logpath $MONGO/logs/shard1-slave1.log --logappend --source localhost:27021 &
mongod -vvv --rest --replSet shard1 --port 27023 --shardsvr --slave  --dbpath $MONGO/shard1/slave2 --pidfilepath $MONGO/pids/shard1-slave2.pid --logpath $MONGO/logs/shard1-slave2.log --logappend --source localhost:27021 &
mongod -vvv --rest --replSet shard2 --port 27024 --shardsvr --master --dbpath $MONGO/shard2/master --pidfilepath $MONGO/pids/shard2-master.pid --logpath $MONGO/logs/shard2-master.log --logappend &
mongod -vvv --rest --replSet shard2 --port 27025 --shardsvr --slave  --dbpath $MONGO/shard2/slave1 --pidfilepath $MONGO/pids/shard2-slave1.pid --logpath $MONGO/logs/shard2-slave1.log --logappend --source localhost:27024 &
mongod -vvv --rest --replSet shard2 --port 27026 --shardsvr --slave  --dbpath $MONGO/shard2/slave2 --pidfilepath $MONGO/pids/shard2-slave2.pid --logpath $MONGO/logs/shard2-slave2.log --logappend --source localhost:27024 &

echo "* Starting config server"
mongod -vvv --rest --configsvr --port 27019 --dbpath $MONGO/config --pidfilepath $MONGO/pids/config.pid --logpath $MONGO/logs/config.log --logappend &

echo "- Waiting for config server to start ..."
sleep 5

echo "* Starting router"
mongos --port 27017 --configdb localhost:27019 --chunkSize 1 --pidfilepath $MONGO/pids/router.pid --logpath $MONGO/logs/router.log --logappend &

