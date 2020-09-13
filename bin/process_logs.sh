#!/usr/bin/env bash

temp=$(mktemp -d)

current= pwd

for var in "$@"
do
	tar --gunzip -xf "$var" | ./bin/process_client_logs.sh
done

./bin/create_username_dist.sh "$temp"

#./bin/create_hours_dist.sh "$temp"

#./bin/create_country_dist.sh "$temp"

#./bin/assemble_report.sh "$temp"

#mv failed_login_summary.html "$current"
