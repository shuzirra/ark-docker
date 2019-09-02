#!/bin/bash
START=`date +"%F_%T"`
echo "Backup started at "$START

arkmanager broadcast "Server backup started ($START)"
arkmanager saveworld
arkmanager backup

FINISH=`date +"%F_%T"`
arkmanager broadcast "COMPLETE ($FINISH)"
echo "Backup finished at "$FINISH
echo
echo
