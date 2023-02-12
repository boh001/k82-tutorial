#!/usr/bin/env bash

function has_node {
  local NODE_NAME=$1
  multipass ls | grep "$NODE_NAME"
}

function start_node {
  local NODE_NAME=$1

  if [[ $(has_node "$NODE_NAME") ]]; then
    multipass start "$NODE_NAME"
  else
    multipass launch -c 2 -m 2G -d 20G -n "$NODE_NAME" 20.04
  fi
}