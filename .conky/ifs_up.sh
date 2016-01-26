#!/bin/bash
############################
# Move to ~/.conky/ifs_up.sh
# chmod +x this file
############################

echo "$(ifconfig -s | awk '{print $1}' | grep -v "Iface" | grep -v "lo")"

