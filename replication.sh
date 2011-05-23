#!/bin/bash

mongo localhost:27021<<EOF
rs.initiate({_id: 'shard1', members: [{_id: 0, host: 'localhost:27021'},
                                      {_id: 1, host: 'localhost:27022'},
                                      {_id: 2, host: 'localhost:27023'}]})
EOF

mongo localhost:27024<<EOF
rs.initiate({_id: 'shard2', members: [{_id: 0, host: 'localhost:27024'},
                                      {_id: 1, host: 'localhost:27025'},
                                      {_id: 2, host: 'localhost:27026'}]})
EOF
