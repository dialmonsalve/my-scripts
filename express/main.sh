#!/bin/zsh

color_red="\e[0;31m"
color_green="\e[0;32m"
color_yellow="\e[0;33m"
color_purple="\e[0;35m"
# Get the file path
filePath=$(readlink -f $0)
# Get the directory path of the file 
directoryPath=$(dirname $filePath)

# Check if the project name already exists
if [[ -d "$1" ]];then
  printf "\n$color_red Project '$1' already exists\n"
  exit 1;
fi

# Check if the project has name
if [[ ! -n "$1" ]];then
  printf "\n$color_red Project name is requerid\n"
  exit 1;
fi

# if Project name is new and has a name
mkdir $1
$directoryPath/packageJSON.sh $1
$directoryPath/files.sh $1

printf "\n"$color_green"Project express $color_yellow'$1'$color_green is created successfully\e[0m"

printf "\nFile $color_green.env\e[0m has been created with "$color_purple"DEV_PORT\e[0m$color_yellow 3000\e[0m, change the variable if you want change the port...\n"

printf ""$color_green"cd\e[0m to $color_green'$1'\e[0m directory and run your project:$color_green npm\e[0m$color_yellow run\e[0m$color_red dev\n\e[0m"

printf "\nLater open default PORT: "$color_green"http://localhost:3000/api\n\e[0m"
