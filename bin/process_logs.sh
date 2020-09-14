#!/usr/bin/env bash

temp=$(mktemp -d)

current=$(pwd)

for var in "$@"
do
	# The directory we'll create to store the unzipped files
	# We use awk and regex to remove unneeded chars
	directoryName=$(echo "$var" | awk -F: 'match($0, /([a-z_]+)\/([a-z]+)/, groups) {print groups[2]}')
	mkdir "$temp"/"$directoryName"
	tar -C "$temp"/"$directoryName" -xf "$var" 
	./bin/process_client_logs.sh "$temp"/"$directoryName"
done

./bin/create_username_dist.sh "$temp"

./bin/create_hours_dist.sh "$temp"

./bin/create_country_dist.sh "$temp"

./bin/assemble_report.sh "$temp"

mv "$temp"/failed_login_summary.html "$current"

# Remove the temporary directory we created
rm -r "$temp"*