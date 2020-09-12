#!/usr/bin/env bash
#cat connects these three htmls and throws them in an html named summary_plots_mid so that wrap contents can combine it with the header and footer and make it into failed_login_summary.html
cat "$1"/country_dist.html "$1"/hours_dist.html "$1"/username_dist.html > "$1"/summary_plots_mid.html

bin/wrap_contents.sh "$1"/summary_plots_mid.html html_components/summary_plots "$1"/failed_login_summary.html 
