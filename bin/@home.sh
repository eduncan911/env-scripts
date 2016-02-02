#!/bin/bash

echo "Enabling Natrual Scrolling for Logitech mouse ..."
xinput set-prop "Logitech USB-PS/2 Optical Mouse" "libinput Natural Scrolling Enabled" 1

echo "Fixing DisplayLink funsies ..."
echo "  - enabling providers (which should always be enabled (bug) ..."
xrandr --setprovideroutputsource 1 0 && xrandr --setprovideroutputsource 2 0
echo "  - pausing 5 seconds ..."
sleep 5
echo "  - updating monitor positions ..."
~/bin/update-monitor-position.sh

echo "Done."
