#!/usr/bin/env bash

# Get directory name given by user
sourceDirectory=$1

# Go to the given directory, if it exists
cd "$sourceDirectory" || exit

# cat * outputs the content of all files in the selected directory
# The output of cat is piped to awk for filtering. By breaking down the text into small groups, and using backreferences, it is possible to extract desired content. Sed is used to remove double spaces in sd numbers.
cat *| awk -F: 'match($0, /([A-Za-z0-9 ]+):([A-Za-z0-9 : \[ \] ]+) ([a-zA-Z0-9]+) ([a-zA-Z0-9]+) from([[0-9 \.]+) /, groups) {print groups[1]" "groups[4]groups[5]}' | sed 's/[ ]\+/ /g' >  failed_login_data.txt

