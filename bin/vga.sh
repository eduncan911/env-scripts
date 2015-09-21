# used to set custom vga modes in multi-user targets

if [ "$1" = "" ]; then
  echo "usage: vga 1440 900"
  return
fi
fbset -g $1 $2 $1 $2 32
