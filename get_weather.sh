#!/bin/bash

CITY=$1

# Get the temperature from wttr.in
TEMPERATURE=$(curl -s "https://wttr.in/$1?format=%t")

# Output the temperature
echo "$TEMPERATURE"
