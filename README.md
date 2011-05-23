Local Mongo Scripts
===================

These are some really simple sample scripts I use to start up my local
shared/replica set mongo instances.

Env Variables
-------------

These scripts all want a $MONGO environment variable setup to point to the root
directory of this repo. This repo sets up data directories for all of the mongo
instances it creates and uses them. Set this up in your bash profile:

    export MONGO="$HOME/src/mongo"

Installing Mongo
----------------

I installed mongodb from [homebrew](http://mxcl.github.com/homebrew/). I do not
load the plist starting file since I'm going to be starting up mongo myself.

Starting and Stoping
--------------------

You can use the start and stop script to start and stop mongo the whole mongo
stack. These scripts are really simple so take a look. They log to the log
folder and end up starting 8 servers. The sharding router and config servers,
followed by two shards. Each shard is setup of a replica set of 3 servers (no
arbiters).

    ./start.sh
    ./stop.sh

Pid files are droped into the pid folder.

Initial Setup
-------------

When you first start up the mongo servers sharding and replication won't be
setup. You don't have to do this again unless you start over with new data
directories. The commands run in these two scripts generate data that is saved
in the servers. For more information please refer to the mongo db documentation
since all of these scripts came directly from their examples.

To setup replication run that script:

    ./replication.sh

This just tells both master servers to start up their replica sets and gives
them the list of their nodes.

To start up sharding run the sharding script:

    ./sharding.sh

This connects to the routing server and has it setup sharding. It does not shard
any collections, you have to do that yourself since this should be generic.
