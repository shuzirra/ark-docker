#!/bin/bash
arkmanager broadcast "Server backup started..."
arkmanager saveworld
arkmanager backup
arkmanager broadcast "...done"