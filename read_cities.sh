#!/bin/bash

FILE="cities.txt"

while IFS= read -r CITY
do
  WEATHER=$(./get_weather.sh "$CITY")
  curl -X POST http://127.0.0.1:5000/add -H "Content-Type: application/json" -d "{\"city\": \"$CITY\", \"weather\": \"$WEATHER\"}"
done < "$FILE"
