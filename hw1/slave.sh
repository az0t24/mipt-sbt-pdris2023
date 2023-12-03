#!/bin/bash

while :
do
  data="$(cat /proc/meminfo | grep 'MemAvailable')"
  read -a arr <<< "$data"
  fileNumber=$(cat "pid.txt")
  echo "$(date +"%T");${arr[1]}kB" >> "logs-${fileNumber}.csv"
  sleep 600
done