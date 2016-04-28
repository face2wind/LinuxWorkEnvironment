#!/bin/sh

add_day_num=0
add_hour_num=0
add_min_num=0

total_time_change_file_path=~/.total_time_changed

if [ ! -f $total_time_change_file_path ] ; then
    echo ""
    echo "$total_time_change_file_path file not exist, create it with 0 0 0"
    echo ""
    echo "0|0|0" > $total_time_change_file_path
fi

last_change_day=`awk -F\| '{print $1}' $total_time_change_file_path`
last_change_hour=`awk -F\| '{print $2}' $total_time_change_file_path`
last_change_min=`awk -F\| '{print $3}' $total_time_change_file_path`
#echo "last_change_day = $last_change_day"
#echo "last_change_hour = $last_change_hour"
#echo "last_change_min = $last_change_min"

function show_help
{
    echo ""
    echo "usage : change_day.sh [-d/-h/-m/-r]"
    echo ""
    echo "-d N  add N day, negative means decrease day"
    echo "-h N  add N hour, negative means decrease hour"
    echo "-m N  add N minute, negative means decrease minute"
    echo "-r    resume to original time"
}

if [ $# == 0 ] ; then
    add_day_num=1
elif [ $# == 1 ] ; then
    if [ "$1" == "-r" ] ; then
	add_day_num=$[0 - $last_change_day]
	add_hour_num=$[0 - $last_change_hour]
	add_min_num=$[0 - $last_change_min]
    else
	show_help
	exit
    fi
elif [ $# == 2 ] ; then
    if [ "$1" == "-d" ] ; then
	add_day_num=$2
    elif [ "$1" == "-h" ] ; then
	    add_hour_num=$2
    elif [ "$1" == "-m" ] ; then
	add_min_num=$2
    else
	show_help
	exit
    fi
else
    show_help
    exit
fi

now_sec=`date +%s`
additional_sec=$[$add_day_num * 3600 * 24 + $add_hour_num * 3600 + $add_min_num * 60 ]
target_sec=$[$now_sec + $additional_sec]

total_additional_day=$[$last_change_day + $add_day_num]
total_additional_hour=$[$last_change_hour + $add_hour_num]
total_additional_min=$[$last_change_min + $add_min_num]
echo "${total_additional_day}|${total_additional_hour}|${total_additional_min}" > $total_time_change_file_path

echo ""
echo "==========================="
echo "now time is : "
date -d @${now_sec}
echo "==========================="
echo ""
echo "add $add_day_num day, $add_hour_num hour, $add_min_num minute"
echo ""
echo "==========================="
echo "time change to : "
date -s @${target_sec}
echo "==========================="

