#!/usr/bin/env bash
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, /([A-Za-z]+) ([0-9 ]+)([A-Za-z0-9]+) ([0-9 \.]+) /, groups) {print groups[3]}' | sort | uniq -c 
