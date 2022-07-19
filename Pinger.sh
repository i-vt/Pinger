#!/bin/sh
 
#Good IPs to test connectivity:
#   8.8.8.8     - Google
#   8.8.4.4     - Google
#   1.1.1.1     - Cloudflare
#also google.com and bing.com works but will display blank in the test file & show errors on the terminal
S_IP="1.1.1.1"
 
#Subfolder for results
S_FOLDER="Ping Results"
 
#Seconds to wait between probes
I_WAITSECONDS=15
 
 
 
S_DATE=$(date --rfc-3339=seconds)
mkdir -p "$S_FOLDER"
S_PATH="$S_FOLDER/$S_DATE"
touch "$S_PATH"
S_SYNTAX="$S_IP -q -A -c 10"
S_KEYWORD="transmitted"
while [ 1!=2 ]
do
    echo
    echo $(date --rfc-3339=seconds) 
    ping $S_IP -c 2 -A | grep "transmitted" 
    echo $(date --rfc-3339=seconds) >> "$S_PATH" 
    ping $S_SYNTAX  | grep "transmitted" >> "$S_PATH"
    echo >> "$S_PATH"
    echo >> "$S_PATH"
    echo >> "$S_PATH"
    sleep $I_WAITSECONDS    
done
