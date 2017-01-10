#!/bin/sh

i=0
while ((i<60))
do
    let ++i
    file_path="/tmp/online_ip_log/"`date +"%Y-%m-%d"`
    file_str=`date +"%H_%M_%S"`
    if [ ! -d "$file_path" ] ; then
	#echo "mkdir $file_path"
	mkdir "$file_path" -p
    fi
    #echo $file_str
    #nmap -sP 192.168.11.*|grep -E "scan report for|Nmap done"
    nmap -sP 192.168.11.*|grep -E "scan report for" | awk '{print $5}' > ${file_path}/${file_str}

    now_hour=`date +"%H"`
    online_in_num=`cat ${file_path}/${file_str} | wc -l`

    #echo "now hour = "$now_hour
    #echo "i = "$i
    #echo "online_in_num = "$online_in_num

    if [ $now_hour -lt 12 ] && [ $i -gt 30 ] && [ $online_in_num -le 50 ] ; then
	#echo "enter company time, long time with people num less than 50, meens today is vacation, do not record"
	echo "[${file_str}] online_ip_num ${online_ip_num} less then 50 so delete file ${file_path} and exit script" > /tmp/online_ip_delete_log
	rm -rf ${file_path}
	exit
    fi

    if [ $now_hour -gt 12 ] && [ $online_in_num -le 50 ] ; then
	#echo "enter company time, people num less than 50 on start record, meens today is vacation, do not record"
	echo "[${file_str}] online_ip_num ${online_ip_num} less then 50 so delete file ${file_path}/${file_str} and exit script" >> /tmp/online_ip_delete_log
	rm -rf ${file_path}/${file_str}
	exit
    fi
    
    sleep 120
done
