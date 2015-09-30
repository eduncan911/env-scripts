#!/bin/bash

# fbterm-bi: a wrapper script to enable background image with fbterm
# usage: fbterm-bi /path/to/image fbterm-options

echo -ne "\e[?251" # hide cursor

fbv -ciuker "$1" << EOF
q
EOF

shift
export FBTERM_BACKGROUND_IMAGE=1
exec fbterm "$@"
