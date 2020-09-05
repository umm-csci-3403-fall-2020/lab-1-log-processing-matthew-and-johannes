#!/usr/bin/env bash

# Get directory name given by user
sourceDirectory=$1

# Go to the given directory, if it exists
cd "$sourceDirectory" || exit

# cat name* outputs the content of all files that start with 'name'
# The output of cat is piped to 
cat secure* | awk '/.*Failed password for.*/ { print;}'
