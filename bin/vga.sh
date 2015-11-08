# used to set custom vga modes in multi-user targets
# usage: sudo vga.sh 1440 900

w=$1
h=$2
if [ "$1" = "" ]; then
	w=1680
	h=1050
fi
fbset -g $w $h $w $h 32
