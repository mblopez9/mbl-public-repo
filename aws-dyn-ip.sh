#!/bin/zsh
# this is for creaiing an address list for whitelising aws IPs for 
# sumologic devices 
# steps to follow to get a file together for whitelist policies for sumologic 
# 1) change to the aws desktop folder and clean up files from previous run  
# 2) use wget to download latest aws ip ranges json file
# 3) Use JQ to parse the file to an output file for use in palo alto policies
# 4) use api to get file to dynamic address group on firewall



cd ~/Desktop/aws-IPranges-json
rm *.txt
rm *.json
wget https://ip-ranges.amazonaws.com/ip-ranges.json
jq  '.prefixes[] | select(.region=="us-east-1" or .region=="us-east-2" or .region=="us-west-1" or .region=="us-west-2")' < ip-ranges.json | 2>&1 | grep .prefix > ip-address.txt
