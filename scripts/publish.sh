#!/bin/bash

CONTINENT=${CONTINENT:-"default"}
SERVER_ADDRESS=${SERVER_ADDRESS:-"http://localhost:8080"}
# CONTINENT=$1  # Kıta adı parametre olarak gelecek
FILE="cities.json"

echo "Processing continent: $CONTINENT"

# JSON dosyasından kıtaya ait şehirleri al
CITIES=$(jq -r --arg continent "$CONTINENT" '.[$continent][]' "$FILE")

while :
do
  for CITY in $CITIES
  do
    echo "City: $CITY"
    WEATHER=$(./get_weather.sh "$CITY")
    echo "Weather: $WEATHER"
    curl -X POST ${SERVER_ADDRESS}/add -H "Content-Type: application/json" -d "{\"city\": \"$CITY\", \"weather\": \"$WEATHER\"}"
  done
done