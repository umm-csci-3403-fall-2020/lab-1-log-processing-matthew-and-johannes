#!/usr/bin/env bash

cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, /([A-Za-z]+) ([0-9]+) ([0-9]+)([A-Za-z0-9]+) ([0-9 \.]+)/, groups) {print groups[3]}' | sort | uniq -c | awk '/.*/ {print "data.addRow([\x27"$2"\x27, "$1"]);"}' > ./data/hours_dist_mid.html

./bin/wrap_contents.sh ./data/hours_dist_mid.html ./html_components/hours_dist "$1"/hours_dist.html
