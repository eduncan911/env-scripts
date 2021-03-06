# TODO, make non-zero, cause VDI format ignores zero padded files!

# this script will create a file of 10 GB to "expand" the current
# virtual hdd.  this is only useful to do before large data dumps 
# as it will pre-expand the disk so to increase the speed.
#
# 1GB = 1024*1024*1024*1 = 1073741824
#echo Creating 1GB files ...
#dd if=/dev/zero of=testfile0_1GB bs=1073741824 count=1
#echo 10%...
#dd if=/dev/zero of=testfile1_1GB bs=1073741824 count=1
#echo 20%...
#dd if=/dev/zero of=testfile2_1GB bs=1073741824 count=1
#echo 30%...
#dd if=/dev/zero of=testfile3_1GB bs=1073741824 count=1
#echo 40%...
#dd if=/dev/zero of=testfile4_1GB bs=1073741824 count=1
#echo 50%...
#dd if=/dev/zero of=testfile5_1GB bs=1073741824 count=1
#echo 60%...
#dd if=/dev/zero of=testfile6_1GB bs=1073741824 count=1
#echo 70%...
#dd if=/dev/zero of=testfile7_1GB bs=1073741824 count=1
#echo 80%...
#dd if=/dev/zero of=testfile8_1GB bs=1073741824 count=1
#echo 90%...
#dd if=/dev/zero of=testfile9_1GB bs=1073741824 count=1
#echo 100%, Done.
#echo Cleaning up tmp files.
#rm testfile*
taskset -c 0 dd if=/dev/urandom of=testfile0_1GB bs=1073741824 count=1
taskset -c 1 dd if=/dev/urandom of=testfile1_1GB bs=1073741824 count=1
taskset -c 2 dd if=/dev/urandom of=testfile2_1GB bs=1073741824 count=1
taskset -c 3 dd if=/dev/urandom of=testfile3_1GB bs=1073741824 count=1
taskset -c 4 dd if=/dev/urandom of=testfile4_1GB bs=1073741824 count=1
taskset -c 5 dd if=/dev/urandom of=testfile5_1GB bs=1073741824 count=1
