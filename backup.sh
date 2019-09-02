#!/bin/bash
START=`date +"%F_%T"`
echo "Backup started at "$START

arkmanager broadcast "Server backup started ($START)"
arkmanager saveworld

timeout=0
while [ $timeout -lt 60 ] && [ $(find /ark/server/ShooterGame/Saved/SavedArks -mmin -1 -name '*.ark' | wc -l) -lt 1 ]; do
    sleep 1
    timeout=$((timeout+1))
    echo "Waiting save world to finish ("$timeout"s) ..."
done

if [ $timeout -ge 60 ]; then
    arkmanager broadcast "World save timeout! Backing up latest save!"
    echo "World save timeout! Backing up latest save!"
else
    arkmanager broadcast "World safe finished in "$timeout"s"
    echo "World safe finished in "$timeout"s"
fi

arkmanager backup

FINISH=`date +"%F_%T"`
arkmanager broadcast "COMPLETE ($FINISH)"
echo "Backup finished at "$FINISH
echo
echo
