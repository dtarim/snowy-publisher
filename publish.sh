#!/bin/bash

FILE="cities.txt"

while IFS= read -r CITY
do
  echo "City: " $CITY
  WEATHER=$(./get_weather.sh "$CITY")
  curl -X POST http://192.168.178.155:5000/add -H "Content-Type: application/json" -d "{\"city\": \"$CITY\", \"weather\": \"$WEATHER\"}"
done < "$FILE"
