#!/bin/bash

# set mouse dpi to dpi param or default it to 400

# ratbagctl device name changes after loading a new mouse profile (MX Master 3)

# get the device name
# -f1 = first field | -d: = set the delimeter to ':'
DEVICE_NAME=$(ratbagctl list | cut -f1 -d ':')

if [[ $1 -eq 0 ]]; then
  ratbagctl $DEVICE_NAME dpi set 400
  exit
fi

ratbagctl $DEVICE_NAME dpi set $1
