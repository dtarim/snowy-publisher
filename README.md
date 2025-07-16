# 🌍 Weather Publisher & Server

This project consists of two components: a **Publisher** and a **Server**, working together to collect and display real-time weather information for 60 cities across 6 continents.

---

## 🧩 Project Overview

- **Publisher**  
  - Reads a list of cities from a JSON structure embedded in its code  
  - Fetches current weather data for each city using the free API at `https://wttr.in`  
  - Sends the collected weather data to the server via HTTP POST request  

- **Server**  
  - Receives weather data from the publisher  
  - Stores the data in memory during runtime  
  - Displays all cities and their current temperatures on a simple web page  

---

## 📁 Project Structure

The project consists of two main folders: `publisher` and `server`.

- **publisher/**  
  Contains the script `publisher.py` that fetches weather data and sends it to the server.  
  It includes a hardcoded list of cities grouped by continent inside the script (no external JSON file needed).  
  Requires Python dependencies: `requests`.

- **server/**  
  Contains the Flask server script `server.py` which receives data and serves a web page showing the weather.  
  Uses Flask and Jinja2 template engine for HTML rendering.  
  Contains an embedded HTML template within the script or in a templates folder.
