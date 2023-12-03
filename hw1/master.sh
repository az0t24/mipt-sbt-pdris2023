#!/bin/bash

pidFile="pid.txt"

command=$1

case $command in
"START")
	if [ ! -e $pidFile ]
	then
	  chmod ugo+rwx slave.sh
	  ./slave.sh &
		echo $! > $pidFile
        echo | cat $pidFile
	fi
	;;

"STOP")
	if [ ! -e $pidFile ]
	then
		echo "Process is not running"
	else
    kill -9 "$(cat $pidFile)"
    rm "$pidFile"
	fi
	;;

"STATUS")
	if [ -e $pidFile ]
	then
		echo "Running"
	else
		echo "Stopped"
	fi
esac