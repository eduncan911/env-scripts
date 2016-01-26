#!/bin/bash
#############################
# Move to ~/.conky/if_list.sh
# chmod +x this file
#############################

IFLST=$("$( dirname "${BASH_SOURCE[0]}" )/ifs_up.sh")

NUM_IFS=$(echo "$IFLST" | wc -l)
pr_if_info() {
    echo '${font Play:normal:size=8}${goto 300}'"$1"'${goto 370}${addr '"$1"'}'
}

for IF in $IFLST
do
    pr_if_info "$IF"
done

echo '${voffset '"$[($NUM_IFS*-13)+1]"'}'
