#!/bin/zsh

# This script is usefull for updating a specific part of the config
# Takes 1 argument: the file to update

# Exit if no argument is provided
if [ -z $1 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# Exit if the file does not exist
if [ ! -f $1 ]; then
  echo "File $1 does not exist"
  exit 1
fi

cp $1 $ZSH/custom/$1
