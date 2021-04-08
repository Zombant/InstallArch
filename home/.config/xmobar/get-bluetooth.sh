#!/bin/bash

RESULT=$(bluetoothctl info)

if [[ $(bluetoothctl info) = "Missing device address argument" ]]; then
 echo "0"
else
 echo "1"
fi

