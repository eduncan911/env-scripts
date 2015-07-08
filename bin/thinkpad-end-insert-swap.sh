#!/bin/bash

# script to remap ThinkPad's "New" keyboard layout.
# - starting with: End/Insert swap!!! why in the hell would you have HOME w/o END?
#
# credit: http://superuser.com/questions/760602/how-to-remap-keys-under-linux-for-a-specific-keyboard-only

# set this to your target keyboard device. 
# "AT Translated Set 2 keyboard" is my laptop keyboard.
remote_id=$(
    xinput list | sed -n 's/.*AT Translated Set 2 keyboard.*id=\([0-9]*\).*keyboard.*/\1/p'
)
[ "$remote_id" ] || exit

# swap END and INSERT keys
# END 		= 87 = <KP1>
# INSERT 	= 90 = <KP0>
mkdir -p /tmp/xkb/symbols
cat >/tmp/xkb/symbols/custom <<\EOF
xkb_symbols "remote" {
	key <KP1> { [ KP_Insert, KP_0, U2195, U21D5 ] };
	key <KP0> { [ KP_End,    KP_1, U2199, U21D9 ] };
};
EOF

setxkbmap -device $remote_id -print | sed 's/\(xkb_symbols.*\)"/\1+custom(remote)"/' | xkbcomp -I/tmp/xkb -i $remote_id -synch - $DISPLAY 2>/dev/null

