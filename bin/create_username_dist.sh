#!/usr/bin/env bas

#cat takes all the failed_login_data files and cats them, then is handed to awk which should hunt down any usernames. Then it is all sorted and handed to uniq which counts how many instances of each name there is (in theory, I haven't tested it since it isn't completed)
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, /([A-Za-z]+) ([0-9 ]+)([A-Za-z0-9]+) ([0-9 \.]+) /, groups) {print groups[3]}' | sort | uniq -c 
