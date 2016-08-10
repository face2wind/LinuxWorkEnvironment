#!/bin/sh
meet_time=`date -d "2005-08-22" +%s`
now_time=`date +%s`

last_time_sec=$((now_time-meet_time))
last_time_day=$((last_time_sec/86400))
last_time_year=$((last_time_day/365))

left_day=$((last_time_day%365))

left_day_sec=$((last_time_sec%86400))

left_hour=$((left_day_sec/3600))
left_min=$((left_day_sec/60%60))
left_sec=$((left_day_sec%60))

echo ""
echo "================================="
echo "我们在2005年8月22日第一次相遇"
echo "到现在为止，我们已经在一起了："
echo "---------------------------------"
#printf "|%9s 秒|\n|%9s 天|\n|%9s 年|\n" $last_time_sec $last_time_day $last_time_year
echo " $last_time_year 年 $left_day 天 $left_hour 小时 $left_min 分钟 $left_sec 秒"
echo "---------------------------------"
echo "================================="
echo ""
