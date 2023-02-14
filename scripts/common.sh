#!/usr/bin/env bash

PROJECT_PATH="$(pwd)"

function has_node {
  local NODE_NAME=$1
  multipass ls | grep "$NODE_NAME"
}

function start_node {
  local NODE_NAME=$1

  if [[ $(has_node "$NODE_NAME") ]]; then
    multipass start "$NODE_NAME"
  else
    multipass launch -c 2 -m 2G -d 10G -n "$NODE_NAME" --mount $PROJECT_PATH:~/common 22.04
  fi
}