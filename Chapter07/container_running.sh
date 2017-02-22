#!/bin/bash

CONTAINER_NAME=$1
CONTAINER_STATE=$(lxc-info --state --name $CONTAINER_NAME | awk '{print $2}')

if [ "$CONTAINER_STATE" != "RUNNING" ]
then
  exit 1
else
  exit 0
fi

