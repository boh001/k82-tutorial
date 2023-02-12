#!/usr/bin/env bash

MASTER_NODE="k82-master"
WORKER_NODE="k82-worker"
WORKER_NUMBER=${1:-3}

source scripts/common.sh

start_node $MASTER_NODE

for i in $(seq 1 "$WORKER_NUMBER")
do
  start_node "$WORKER_NODE-$i"
done