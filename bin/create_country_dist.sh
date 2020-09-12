#!/usr/bin/env bash

# Open the failed_login_data.txt files in all subdirectoris of the directory given by the user
# Use awk and regex to find the IP address numbers
# Sort the output with sort
cat "$1"/*/failed_login_data.txt | awk -F: 'match($0, /([0-9.]{3,})/, groups) {print groups[1]}' | sort |

# Use join to join the IP addresses with the country codes in the etc/country_IP_map.txt file
# The -o 2.2 option specifies that we want to only print the country codes,
# which are in the second field of the second file
# Finally, we sort the output and send it further down the pipe
join -o 2.2 - etc/country_IP_map.txt | sort |

