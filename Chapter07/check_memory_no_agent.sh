#!/bin/bash
# Checks memory usage for an LXC container from cgroups

usage()
{
  echo "Usage: `basename $0` -n|--name monitor_lxc -w|--warning 5000 -e|--error 10000"
  exit 2
}

sanity_check()
{
  if [ "$CONTAINER_NAME" == "" ] || [ "$WARNING" == "" ] || [ "$ERROR" == "" ]
  then
    usage
  fi
}

report_result()
{
  if [ "$MEMORY_USAGE" -ge "$ERROR" ]
  then
    echo "CRITICAL - Memory usage too high at $MEMORY_USAGE"
    exit 2
  elif [ "$MEMORY_USAGE" -ge "$WARNING" ]
  then
    echo "WARNING - Memory usage at $MEMORY_USAGE"
    exit 1
  else
    echo "Memory Usage OK at $MEMROY_USAGE"
    exit 0
  fi
}

get_memory_usage()
{
  declare -g -i MEMORY_USAGE=0

  MEMORY_USAGE=$(cat /sys/fs/cgroup/memory/lxc/$CONTAINER_NAME/memory.usage_in_bytes)
}

main()
{
  sanity_check
  get_memory_usage
  report_result
}

while [[ $# > 1 ]]
do
  key=$1

  case $key in
    -n|--name)
      CONTAINER_NAME=$2
      shift
    ;;
    -w|--warning)
      WARNING=$2
      shift
    ;;
    -e|--error)
      ERROR=$2
      shift
    ;;
    *)
      usage
    ;;
  esac
  shift
done

main

