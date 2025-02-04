#!/bin/bash

CONTINENT=$1  # Kıta adı parametre olarak gelecek
FILE="cities.json"

echo "Processing continent: $CONTINENT"

# JSON dosyasından kıtaya ait şehirleri al
CITIES=$(jq -r --arg continent "$CONTINENT" '.[$continent][]' "$FILE")

for CITY in $CITIES
do
  echo "City: $CITY"
  WEATHER=$(./get_weather.sh "$CITY")
  echo "Weather: $WEATHER"
  curl -X POST http://192.168.178.155:5000/add -H "Content-Type: application/json" -d "{\"city\": \"$CITY\", \"weather\": \"$WEATHER\"}"
done
