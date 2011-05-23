#!/bin/bash

mongo localhost:27017/admin<<EOF
db.runCommand({ addshard: "shard1/localhost:27021,localhost:27022,localhost:27023" })
db.runCommand({ addshard: "shard2/localhost:27024,localhost:27025,localhost:27026" })
db.runCommand({ enablesharding: "savewave" });
EOF
