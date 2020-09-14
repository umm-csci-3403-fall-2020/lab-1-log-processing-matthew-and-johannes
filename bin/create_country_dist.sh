#!/usr/bin/env bash

# Open the failed_login_data.txt files in all subdirectoris of the directory given by the user
# Use awk and regex to find the IP address numbers
# Sort the output with sort
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, / ([0-9.]{3,})/, groups) {print groups[1]}' | sort |

# Use join to join the IP addresses with the country codes in the etc/country_IP_map.txt file
# The -o 2.2 option specifies that we want to only print the country codes,
# which are in the second field of the second file
# Finally, we sort the output and send it further down the pipe
join -o 2.2 - etc/country_IP_map.txt | sort |

# Use uniq with count option (-c) to count the number of occurances of each country
# Use awk to print this data into the appropriate fields of the country_dist.html file
uniq -c | awk '/.*/ {print "data.addRow([\x27"$2"\x27, "$1"]);"}' > "$1"/country_dist_mid.html

# Wrap contents with a header and footer using the wrap_contents.sh script
./bin/wrap_contents.sh "$1"/country_dist_mid.html ./html_components/country_dist "$1"/country_dist.html
