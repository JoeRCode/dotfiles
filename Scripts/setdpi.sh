#!/bin/bash

# set mouse dpi to dpi param or default it to 400

if [[ $1 -eq 0 ]]; then
  ratbagctl singing-gundi dpi set 400
  exit
fi

ratbagctl singing-gundi dpi set $1
