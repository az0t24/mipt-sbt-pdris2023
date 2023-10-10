#!/bin/bash

while :
do
  data="$(cat /proc/meminfo | grep 'MemAvailable')"
  read -a arr <<< "$data"
  echo "$(date +"%T");${arr[1]}kB" >> "logs.txt"
  sleep 600
done