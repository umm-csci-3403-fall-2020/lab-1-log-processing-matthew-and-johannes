#!/usr/bin/env bash

# Open the failed_login_data.txt files in all subdirectoris of the directory given by the user
# Use awk to find the second column of numbers (which corresponds to the log hours)
# Sort the output with sort
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, / ([0-9]+) ([0-9]+)/, groups) {print groups[2]}' | sort |

# Use uniq with count option (-c) to count the number of occurances of each clock hour
# Use awk to print this data into the appropriate fields of the hours_dist_mid.html file
uniq -c | awk '/.*/ {print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$1"/hours_dist_mid.html

# Wrap contents with a header and footer using the wrap_contents.sh script
./bin/wrap_contents.sh "$1"/hours_dist_mid.html ./html_components/hours_dist "$1"/hours_dist.html
