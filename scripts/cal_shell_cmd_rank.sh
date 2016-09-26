# can not use this "#!/bin/sh" or history don't work

show_row=20

if [ $# = 1 ] ; then
    show_row=$1
fi

#history | awk '{CMD[$5]++;count++} END { for(a in CMD)print CMD[a]" "CMD[a]/count*100 "% " a }' | grep -v "./" | column -c3 -s " " -t | sort -nr |nl | head -n $show_row
history | awk '{CMD[$5]++;allCount++} END {for(a in CMD)printf("%5s %7s%% %s\n",CMD[a],100*CMD[a]/allCount,a)}'| sort -k 1rn | nl|head -n $show_row | awk 'BEGIN {printf("\n%5s |%3s |%3s | %s\n-------------------------------\n","排名","次数","频率","命\
 令");} {print $0}'
