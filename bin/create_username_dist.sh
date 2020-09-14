#!/usr/bin/env bash

# cat takes all the failed_login_data files and cats them, then is handed to awk which should hunt down any usernames.
# Then it is all sorted and handed to uniq which counts how many instances of each name 
# there are which then is given to another awk that puts it into the format we need. 
# Then it makes a file that is used in the wrap_contents.
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, /([A-Za-z]+) ([0-9 ]+)([A-Za-z0-9]+) ([0-9 \.]+)/, groups) {print groups[3]}' | sort | uniq -c | awk '/.*/ {print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$1"/username_dist_mid.html
./bin/wrap_contents.sh "$1"/username_dist_mid.html ./html_components/username_dist "$1"/username_dist.html
