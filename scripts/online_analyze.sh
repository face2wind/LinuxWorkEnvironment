#!/bin/sh

date_str=`date +"%m-%d"`
if [ $# -eq 1 ] ; then
    date_str="$1"
fi

cd /tmp/online_ip_log/`date +"%Y"`-$date_str/
for i in * ; do echo $i" "`cat $i|wc -l`; done

