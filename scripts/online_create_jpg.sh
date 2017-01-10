#!/bin/sh

log_root_dir=/tmp/online_ip_log/

cd $log_root_dir

for log_dir in * ; do
    #log_dir=2016-12-30

    if [ ! -d $log_root_dir/$log_dir ] ; then
#	echo "${log_dir} NOT DIRECTORY"
	continue
    fi

    cd $log_root_dir/$log_dir
    log_type=enter
    ls | grep -E "^08|^09|^10" > log_file_list
    log_file_num=`cat log_file_list | wc -l`

    if [ -f "${log_root_dir}/${log_dir}_${log_type}.jpg" ] ; then
	echo $log_root_dir/${log_dir}_$log_type".jpg - Exist"
    elif [ $log_file_num -gt 0 ] ; then
	tmp_data_file=$log_root_dir/${log_dir}_$log_type.data
	tmp_gnuplot_file=$log_root_dir/${log_dir}_$log_type.plot
	for i in `cat log_file_list` ; do echo $i" "`cat $i|wc -l`; done > $tmp_data_file
	cat /face2wind/study/LinuxWorkEnvironment/scripts/online_ip.gnuplot | sed 's/xxx/'"$log_dir"'_'"$log_type"'/g' > $tmp_gnuplot_file
	cd $log_root_dir
	gnuplot $tmp_gnuplot_file
	
	rm -rf $tmp_data_file $tmp_gnuplot_file
	echo $tmp_gnuplot_file" - Succ"
    fi
    
    cd $log_root_dir/$log_dir
    log_type=leave
    ls | grep -E "^15|^16|^17|^18|^19|^20|^21|^22" > log_file_list
    log_file_num=`cat log_file_list | wc -l`

    if [ -f "${log_root_dir}/${log_dir}_${log_type}.jpg" ] ; then
	echo $log_root_dir/${log_dir}_$log_type".jpg - Exist"
    elif [ $log_file_num -gt 0 ] ; then
	tmp_data_file=$log_root_dir/${log_dir}_$log_type.data
	tmp_gnuplot_file=$log_root_dir/${log_dir}_$log_type.plot
	for i in `cat log_file_list` ; do echo $i" "`cat $i|wc -l`; done > $tmp_data_file
	cat /face2wind/study/LinuxWorkEnvironment/scripts/online_ip.gnuplot | sed 's/xxx/'"$log_dir"'_'"$log_type"'/g' > $tmp_gnuplot_file
	cd $log_root_dir
	gnuplot $tmp_gnuplot_file
	
	rm -rf $tmp_data_file $tmp_gnuplot_file
	echo $tmp_gnuplot_file" - Succ"
    fi
    
    #exit
done

