#!/bin/zsh

color_red="\e[0;31m"

# Moved to the new project directory
cd $1
name=$(echo "$1" | tr '[:upper:]' '[:lower:]')

# Create the package.json
echo '{
  "name": "'$name'",
  "version": "1.0.0",
  "description": "",
  "main": "app.js",
  "scripts": {
    "dev": "nodemon"
  },
  "keywords": [],
  "author": "",
  "license": "ISC",
  "dependencies": {
    "dotenv": "16.3.1",
    "express": "4.18.2"
  },
  "devDependencies": {
    "@types/express": "4.17.21",
    "@types/node": "20.10.5",
    "nodemon": "3.0.2",
    "rome": "12.1.3",
    "typescript": "5.3.3"
  }
}' > package.json

# Check if npm is not installed
if ! command -v npm &> /dev/null; then
  printf "\n$$color_red npm isn't installed\n"
  exit 1
fi

# If npm is installed
npm install --update