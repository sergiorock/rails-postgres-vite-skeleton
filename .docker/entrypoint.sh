#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /usr/src/app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"

turquoise="\033[36m"

echo -e "${turquoise}Starting the application in ${MODE} mode...${reset}"

# Create Database
echo -e "${turquoise}Creating Database...${reset}"
rails db:create

# Apply database migrations
echo -e "${turquoise}Applying database migrations...${reset}"
rails db:migrate

# Apply database migrations
echo -e "${turquoise}Creating seeds...${reset}"
rails db:seed

# Start server
echo -e "${turquoise}Starting server...${reset}"

foreman start -f Procfile.dev