#!/bin/bash
#
# /etc/rc.d/rc.zram
# Script to start zRam (Virtual Swap Compressed in RAM)

# Size of swap space in MB
# default 1GB

SIZE=256 #MB

start() {
    modprobe zram
    echo $SIZE*1024*1024 | bc > /sys/block/zram0/disksize
    mkswap /dev/zram0
    swapon -p 10 /dev/zram0
}

stop() {
    swapoff /dev/zram0
}

case "$1" in
    start)
	start
	;;

    stop)
	stop
	;;

    restart)
	echo 1 > /sys/block/zram0/reset
	;;

    *)
	echo "Usage: $0 (start|stop|restart)"
esac
